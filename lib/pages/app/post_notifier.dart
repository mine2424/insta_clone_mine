import 'package:state_notifier/state_notifier.dart';

import 'package:insta_clone/common/helper/helpers.dart';
import 'package:insta_clone/domain/post/models/post_list.dart';
import 'package:insta_clone/domain/post/post_repository.dart';
import 'package:insta_clone/pages/app/app_notifier.dart';
import 'package:insta_clone/widgets/dialog/error_dialog.dart';

class PostNotifier extends StateNotifier<PostList> {
  PostNotifier({
    required this.postRepository,
    required this.appNotifier,
  }) : super(const PostList()) {
    fetchPost();
  }

  final AppNotifier appNotifier;
  final PostRepository postRepository;

  Future<void> fetchPost() async {
    final allPostsResult =
        await postRepository.fetchPost(dateId: await Helpers.dateId);

    if (allPostsResult.isError) {
      final context = appNotifier.navigatorKey.currentContext!;

      ErrorDialog('投稿の取得に失敗しました').show(context);

      return;
    }

    final allPosts = allPostsResult.asValue!.value;

    state = state.copyWith(postList: allPosts);
  }
}
