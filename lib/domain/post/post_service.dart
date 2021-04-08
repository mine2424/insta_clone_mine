import 'package:insta_clone/common/helper/helpers.dart';
import 'package:intl/intl.dart';

class PostService {
  Future<String> dateId() async {
    final time = await Helpers.ntpTime;

    return DateFormat('yyyy/MM/dd').format(time);
  }
}
