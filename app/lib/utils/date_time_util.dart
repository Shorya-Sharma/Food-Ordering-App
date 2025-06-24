import 'package:intl/intl.dart';

class DateTimeUtil {
  static String formatTime(DateTime timestamp) {
    DateTime now = DateTime.now();
    DateTime msgTime = timestamp;
    if (now.year == msgTime.year &&
        now.month == msgTime.month &&
        now.day == msgTime.day &&
        now.day == msgTime.day) {
      return DateFormat.Hm().format(msgTime);
    } else if (now.year == msgTime.year &&
        now.month == msgTime.month &&
        now.day == msgTime.day &&
        now.day == msgTime.day + 1) {
      return "Yesterday";
    } else {
      return DateFormat.yMd().format(msgTime);
    }
  }
}
