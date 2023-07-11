import 'package:intl/intl.dart';

class DateTimeFormatter {
  static String formateDate(String? stringDate) {
    if (stringDate == null || stringDate.isEmpty) {
      return '';
    } else {
      DateTime date = DateTime.parse(stringDate);
      String formattedDate = DateFormat('MMM dd, yyyy').format(date);
      return formattedDate;
    }
  }

  static Duration getDuration(String? stringDateTime) {
    if (stringDateTime != null) {
      DateTime dateTime = DateTime.parse(stringDateTime);
      DateTime currentTime = DateTime.now();
      Duration difference = currentTime.difference(dateTime);
      return difference;
    } else {
      return const Duration();
    }
  }

  static String formateDuration(String? stringDateTime) {
    Duration duration = getDuration(stringDateTime);
    if (duration.inDays > 365) {
      int years = duration.inDays ~/ 365;
      return '$years years ago';
    } else if (duration.inDays > 30) {
      int months = duration.inDays ~/ 30;
      return '$months months ago';
    } else if (duration.inDays > 0) {
      return '${duration.inDays} days ago';
    } else if (duration.inHours > 0) {
      return '${duration.inHours} hours ago';
    } else if (duration.inMinutes > 0) {
      return '${duration.inMinutes} minutes ago';
    } else {
      return 'Just now';
    }
  }
}
