import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String formatToString() {
    final format = DateFormat("dd MMMM yyyy");
    final formatted = format.format(toLocal());
    return formatted;
  }
}
