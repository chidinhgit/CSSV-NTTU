import 'package:flutter/material.dart';
import '../../API/ykiencanhanAPI.dart';
import '../../Model/ykiencanhanmodel.dart';

class UserInterface extends StatelessWidget {
  final APIykiencanhan apiService = APIykiencanhan();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Danh sách ý kiến',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Danh sách ý kiến'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: FutureBuilder<List<YKienCaNhan>>(
          future: apiService.fetchYKienCaNhan(),
          builder: (BuildContext context, AsyncSnapshot<List<YKienCaNhan>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Center(child: Text('Error fetching data'));
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  YKienCaNhan ykien = snapshot.data![index] as YKienCaNhan;
                  return Card(
                     margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ykien.tieuDe,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18, // Chỉnh kích thước tiêu đề
                            ),
                          ),
                          SizedBox(height: 8), // Khoảng cách giữa tiêu đề và nội dung
                          Text(
                            ykien.noiDung,
                            style: TextStyle(
                              fontSize: 16, // Chỉnh kích thước nội dung
                            ),
                          ),
                        ],
                      ),
                      // Hiển thị các trường khác nếu cần
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
