import 'package:intl/intl.dart';

String getDateTimeNow() {
  var now = new DateTime.now();
  var formatter = new DateFormat('yyyy-MM-dd HH:mm:ss');
  String formatted = formatter.format(now);
  // print(formatted.toString());
  return formatted.toString();
}
