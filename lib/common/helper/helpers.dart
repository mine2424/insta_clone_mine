import 'package:ntp/ntp.dart';

class Helpers {
  static Future<DateTime> get ntpTime => NTP.now();
}
