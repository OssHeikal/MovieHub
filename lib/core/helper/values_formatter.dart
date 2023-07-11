import 'package:intl/intl.dart';

class ValuesFormatter {
  static String formatRuntime(int? runtimeInMinutes) {
    if (runtimeInMinutes == null) {
      return '';
    }

    if (runtimeInMinutes < 60) {
      return '${runtimeInMinutes}m';
    }

    final hours = runtimeInMinutes ~/ 60;
    final minutes = runtimeInMinutes % 60;
    final formattedRuntime = '${hours}h ${minutes}m';
    return formattedRuntime;
  }

  static String formatVoteCount(int voteCount) {
    return NumberFormat('#,##0').format(voteCount);
  }
}
