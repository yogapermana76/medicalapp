import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  final now = DateTime.now();
  final difference = now.difference(date).inDays;

  if (difference == 0) {
    return 'Today'; // Change this to "Now" if you want it for current time
  } else if (difference == 1) {
    return 'Yesterday';
  } else if (difference < 7) {
    return DateFormat('EEEE')
        .format(date); // Returns day of the week, e.g., "Monday"
  } else {
    return DateFormat('d MMM yyyy')
        .format(date); // Custom format for older dates
  }
}
