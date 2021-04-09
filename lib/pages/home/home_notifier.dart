import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:insta_clone/domain/post/post_repository.dart';
import 'package:insta_clone/domain/post/post_service.dart';

import 'package:insta_clone/pages/home/states/home_state.dart';

import 'package:state_notifier/state_notifier.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier({
    required this.postRepository,
  }) : super(const HomeState());

  final PostRepository postRepository;

  Future<void> addPost() async {
    try {
      await postRepository.addPost(
        dateId: PostService.dateId,
        content: state.content,
        postImage: state.postImage,
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> setImageFromGallery() async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      state = state.copyWith(postImageFile: File(pickedFile.path));
    }
    postRepository;
  }

  void saveContent(String value) {
    state = state.copyWith(content: value);
  }
}
