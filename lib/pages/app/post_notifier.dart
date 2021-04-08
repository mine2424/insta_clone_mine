import 'package:insta_clone/domain/post/models/post_list.dart';
import 'package:insta_clone/domain/post/post_repository.dart';
import 'package:insta_clone/domain/post/post_service.dart';

import 'package:state_notifier/state_notifier.dart';

class PostNotifier extends StateNotifier<PostList> {
  PostNotifier({
    required this.postRepository,
    required this.postService,
  }) : super(const PostList());

  final PostRepository postRepository;
  final PostService postService;

  Future<void> fetchPost() async {
    await postRepository.fetchPost(service: postService);
  }
}
