import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_clone/common/helper/helpers.dart';
import 'package:insta_clone/domain/post/post_repository.dart';
import 'package:insta_clone/domain/user/models/user.dart';
import 'package:insta_clone/pages/app/app_notifier.dart';
import 'package:insta_clone/pages/app/user_notifier.dart';

import 'package:insta_clone/pages/home/states/home_state.dart';
import 'package:insta_clone/widgets/dialog/error_dialog.dart';

import 'package:state_notifier/state_notifier.dart';
import 'package:uuid/uuid.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier({
    required this.postRepository,
    required this.appNotifier,
    required this.userNotifier,
  }) : super(const HomeState()) {
    userNotifier.fetchUser();
  }

  final PostRepository postRepository;
  final AppNotifier appNotifier;
  final UserNotifier userNotifier;

  final messageController = TextEditingController();

  Future<void> addPost(User user) async {
    final dateId = await Helpers.dateId;

    final postId = const Uuid().v4();

    if (state.postImageFile != null) {
      final imagePathResult = await postRepository.addPostImageToStorage(
        '/posts/$dateId/$postId',
        state.postImageFile!,
      );

      if (imagePathResult.isError) {
        final context = appNotifier.navigatorKey.currentContext!;

        ErrorDialog('画像が送信できませんでした。インターネットが接続されているかご確認ください。').show(context);
      }

      final imagePath = imagePathResult.asValue!.value;

      state = state.copyWith(postImage: imagePath);
    }

    try {
      await postRepository.addPost(
        dateId: dateId,
        postId: postId,
        user: user,
        content: messageController.text,
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
      print(state.postImageFile);
    }
  }
}
