import 'package:intl/intl.dart';

class MyFunction
{
  String layngayhientai ()
  {
    return '';
  }
  String convertDateSQL(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  String convertDateFlutter(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }


}