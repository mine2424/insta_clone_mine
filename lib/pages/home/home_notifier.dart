import 'dart:io';

import 'package:async/async.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_clone/domain/post/post_repository.dart';
import 'package:insta_clone/domain/post/post_service.dart';
import 'package:insta_clone/domain/user/models/user.dart';

import 'package:insta_clone/pages/home/states/home_state.dart';

import 'package:state_notifier/state_notifier.dart';
import 'package:uuid/uuid.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier({
    required this.postRepository,
  }) : super(const HomeState());

  final PostRepository postRepository;

  Future<void> addPost(User user) async {
    final dateId = await PostService.dateId;

    final postId = const Uuid().v4();

    try {
      // TODO: storageに画像を保存させる
      if (state.postImageFile != null) {
        final imagePath = await postRepository.addPostImageToStorage(
          '/posts/$dateId/$postId',
          state.postImageFile!,
        );

        state = state.copyWith(postImage: imagePath);
      }

      await postRepository.addPost(
        dateId: dateId,
        postId: postId,
        user: user,
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
  }

  void saveContent(String value) {
    state = state.copyWith(content: value);
  }
}
