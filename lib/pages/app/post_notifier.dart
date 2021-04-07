import 'package:insta_clone/domain/post/models/post_list.dart';

import 'package:state_notifier/state_notifier.dart';

class PostNotifier extends StateNotifier<PostList> {
  PostNotifier() : super(const PostList());
}
