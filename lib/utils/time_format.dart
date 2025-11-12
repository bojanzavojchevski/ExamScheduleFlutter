import 'package:intl/intl.dart';

class TimeFmt {
  static String date(DateTime dt) => DateFormat.yMMMMd().format(dt);
  static String time(DateTime dt) => DateFormat.Hm().format(dt);

  static String until(DateTime target) {
    var d = target.difference(DateTime.now());
    if (d.isNegative) d = Duration.zero;
    final days = d.inDays;
    final hours = d.inHours - days * 24;
    return '$days days, $hours hours';
  }

  static bool isPast(DateTime dt) => dt.isBefore(DateTime.now());
}
