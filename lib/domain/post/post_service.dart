import 'package:insta_clone/common/helper/helpers.dart';
import 'package:intl/intl.dart';

class PostService {
  static get ntpTime => Helpers.ntpTime;

  static get dateId async => DateFormat('yyyy/MM/dd').format(await ntpTime);
}
