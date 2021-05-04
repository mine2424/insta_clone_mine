import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_clone/domain/user/models/user.dart';
import 'package:insta_clone/domain/user/user_repository.dart';
import 'package:insta_clone/domain/user/user_service.dart';
import 'package:insta_clone/pages/app/app_notifier.dart';
import 'package:insta_clone/widgets/dialog/error_dialog.dart';
import 'package:state_notifier/state_notifier.dart';

import 'package:insta_clone/pages/sign_in/states/sign_in_state.dart';

class SignInNotifier extends StateNotifier<SignInState> {
  SignInNotifier({
    required this.appNotifier,
    required this.repository,
    required this.service,
  }) : super(const SignInState());

  final UserService service;
  final UserRepository repository;
  final AppNotifier appNotifier;

  late final nameController = TextEditingController();
  late final emailController = TextEditingController();
  late final passwordController = TextEditingController();
  late final bioController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  void selectProfileImage() async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      state = state.copyWith(userImageFile: File(pickedFile.path));
    }
  }

  Future<UserStatus> addUser(String name, String email, String password) async {
    final result = await service.signUpEmail(
      email: email,
      password: password,
    );

    if (result.isError) {
      final context = appNotifier.navigatorKey.currentContext!;

      ErrorDialog('サインインできませんでした。\nインターネット環境をご確認ください').show(context);

      return UserStatus.error;
    }

    final uid = service.userId;

    if (uid == null) {
      //TODO: show error
      return UserStatus.none;
    }

    final addUserResult = await repository.addUser(uid: uid, name: name);

    if (addUserResult.isError) {
      final context = appNotifier.navigatorKey.currentContext!;

      ErrorDialog('ユーザー登録時にエラーが発生しました。\nインターネット環境をご確認ください').show(context);

      return UserStatus.error;
    }

    return UserStatus.success;
  }

  Future<void> addUserInfo(
    File? userImageFile,
    String? message,
  ) async {
    final uid = service.userId;

    if (uid == null) {
      //TODO: show error.
      return;
    }

    String? userImage;

    if (userImageFile != null) {
      userImage = await saveUserImage(userImageFile, uid);
    }

    final addUserResult = await repository.addUserInfo(
      uid: uid,
      message: message,
      userImage: userImage,
    );

    if (addUserResult.isError) {
      final context = appNotifier.navigatorKey.currentContext!;

      ErrorDialog('ユーザー登録時にエラーが発生しました。\nインターネット環境をご確認ください').show(context);

      return;
    }

    await repository.fetchUser(uid);
  }

  Future<String> saveUserImage(File file, String uid) async {
    final path = '/users/$uid';

    final result = await repository.addUserImageToStorage(path, file);

    if (result.isError) {
      final context = appNotifier.navigatorKey.currentContext!;

      ErrorDialog('画像が保存できませんでした').show(context);

      //TODO: error handling
      return '';
    }

    return result.asValue!.value;
  }
}
