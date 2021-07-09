import 'package:intl/intl.dart';

class DateFormatter {
  getCourseDate(DateTime date) => DateFormat('d-MM-yyyy').format(date);
  geTime(DateTime date) => DateFormat('hh:mm a').format(date);
}
