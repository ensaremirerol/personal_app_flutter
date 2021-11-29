import 'package:intl/intl.dart';

String humanizeDateString(String? str, [DateFormat? format]) {
  if (str == null) return "";
  format ??= DateFormat.yMMM();
  final List<String> parts = str.split('-');
  final DateTime date =
      DateTime(int.parse(parts[0]), int.parse(parts[1]), int.parse(parts[2]));
  return format.format(date);
}
