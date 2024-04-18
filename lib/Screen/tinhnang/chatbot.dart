import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatBot(currentLanguage: 'en'),
    );
  }
}

class ChatBot extends StatefulWidget {
  final String currentLanguage;

  ChatBot({Key? key, required this.currentLanguage}) : super(key: key);

  @override
  _ChatBotState createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();
  bool _isSending = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Bot'),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              reverse: true,
              padding: EdgeInsets.all(8.0),
              itemCount: _messages.length,
              itemBuilder: (_, int index) => _messages[index],
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration.collapsed(
                  hintText: "Send a message",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon:
                    _isSending ? CircularProgressIndicator() : Icon(Icons.send),
                onPressed: _isSending
                    ? null
                    : () => _handleSubmitted(_textController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String text) async {
    if (text.isEmpty) {
      return;
    }

    _textController.clear();

    // Add user's message to the chat
    ChatMessage userMessage = ChatMessage(
      text: text,
      type: MessageType.User,
    );
    _addMessage(userMessage);

    // Get bot's response using NLP
    String botResponse = await getBotResponseNLP(text);

    // Add bot's response to the chat
    ChatMessage botMessage = ChatMessage(
      text: botResponse,
      type: MessageType.Bot,
    );
    _addMessage(botMessage);
  }

  void _addMessage(ChatMessage message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  Future<String> getBotResponseNLP(String userQuery) async {
    final http.Response httpResponse = await http.post(
      Uri.parse('http://your-rasa-nlu-server/parse'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'q': userQuery,
        'project': 'your-rasa-nlu-project',
        'model': 'your-rasa-nlu-model',
      }),
    );

    if (httpResponse.statusCode == 200) {
      final Map<String, dynamic> responseData =
          jsonDecode(httpResponse.body) as Map<String, dynamic>;

      final String intent = responseData['intent']['name'];
      final String language = widget.currentLanguage;

      // Kiểm tra từ người dùng có tồn tại trong câu trả lời đã định sẵn cho ngôn ngữ hiện tại hay không
      String botResponse =
          predefinedResponses[intent.toLowerCase() + language] ?? '';

      return botResponse.isNotEmpty
          ? botResponse
          : 'Xin lỗi, tôi không hiểu câu hỏi của bạn.';
    } else {
      throw Exception('Failed to get response from NLP server');
    }
  }
}

enum MessageType {
  User,
  Bot,
}

class ChatMessage extends StatelessWidget {
  ChatMessage({required this.text, required this.type});

  final String text;
  final MessageType type;

  List<Widget> messageChildren() {
    return <Widget>[
      Container(
        margin: const EdgeInsets.only(right: 16.0),
        child: CircleAvatar(
          child: Text(type == MessageType.User ? 'U' : 'B'),
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              type == MessageType.User ? 'You' : 'Chat Bot NTTU',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Text(text),
            ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: messageChildren(),
      ),
    );
  }
}

Map<String, String> predefinedResponses = {
  'helloen':
      'Hello! I am the chatbot of Nguyen Tat Thanh University, nice to meet you.',
  'hellovi':
      'Xin chào! Tôi là chatbot của Đại học Nguyễn Tất Thành, rất vui được gặp bạn.',
  'informationen':
      'Nguyen Tat Thanh University is a prestigious university in Vietnam.',
  'informationvi':
      'Đại học Nguyễn Tất Thành là một trường đại học uy tín tại Việt Nam.',
  // Thêm các từ khóa và câu trả lời tương ứng của bạn
};
