import 'package:insta_clone/domain/post/models/post.dart';
import 'package:insta_clone/domain/post/models/post_list.dart';
import 'package:insta_clone/domain/post/post_repository.dart';
import 'package:insta_clone/domain/post/post_service.dart';

import 'package:state_notifier/state_notifier.dart';

class PostNotifier extends StateNotifier<PostList> {
  PostNotifier({required this.postRepository}) : super(const PostList()) {
    fetchPost();
  }

  final PostRepository postRepository;

  Future<void> fetchPost() async {
    final allPostsResult =
        await postRepository.fetchPost(dateId: await PostService.dateId);

    if (allPostsResult.isError) {
      // TODO: エラー処理追加
      return;
    }

    final allPosts = allPostsResult.asValue!.value;

    state = state.copyWith(postList: allPosts);
  }
}
