import 'package:intl/intl.dart';
import 'package:ntp/ntp.dart';

class Helpers {
  static Future<DateTime> get ntpTime => NTP.now();

  static get dateId async => DateFormat('yyyy-MM').format(await ntpTime);
}
