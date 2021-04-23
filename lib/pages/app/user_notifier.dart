import 'package:flutter/material.dart';
import 'package:insta_clone/pages/app/app_notifier.dart';
import 'package:insta_clone/widgets/dialog/error_dialog.dart';

import 'package:state_notifier/state_notifier.dart';

import 'package:insta_clone/domain/user/models/user.dart';
import 'package:insta_clone/domain/user/user_repository.dart';
import 'package:insta_clone/domain/user/user_service.dart';
import 'package:insta_clone/pages/app/states/user_state.dart';

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier({
    required this.repository,
    required this.service,
    required this.appNotifier,
    required this.context,
  }) : super(const UserState());

  final UserRepository repository;
  final UserService service;
  final AppNotifier appNotifier;
  final BuildContext context;

  void listenAuthStatus() {
    final result = service.userId;

    //TODO: エラーなのかただユーザー登録されていないのかどっち？
    if (result == null) {
      state = state.copyWith(userStatus: UserStatus.none);
      return;
    }

    state = state.copyWith(userStatus: UserStatus.email);
    print(result);
  }

  Future<UserStatus> addUser(String name, String email, String password) async {
    final result = await service.signUpEmail(
      email: email,
      password: password,
    );

    if (result.isError) {
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
      // ErrorDialog('ユーザー登録時にエラーが発生しました。\nインターネット環境をご確認ください').show(context);
      return UserStatus.error;
    }

    await fetchUser();

    return UserStatus.success;
  }

  Future<void> addUserInfo(
    String name,
    String userImage,
    String message,
  ) async {
    final uid = service.userId;

    if (uid == null) {
      //TODO: show error.
      return;
    }

    final addUserResult = await repository.addUser(
      name: name,
      uid: uid,
      message: message,
      userImage: userImage,
    );

    if (addUserResult.isError) {
      // ErrorDialog('ユーザー登録時にエラーが発生しました。\nインターネット環境をご確認ください').show(context);
      return;
    }
  }

  Future<void> fetchUser() async {
    final uid = service.userId;

    if (uid == null) {
      //TODO: show error
      return;
    }

    final userResult = await repository.fetchUser(uid);

    if (userResult.isError) {
      // ErrorDialog('ユーザー情報取得時にエラーが発生しました。\nインターネット環境をご確認ください').show(context);
      return;
    }

    final user = userResult.asValue!.value;

    state = state.copyWith(user: user);
  }
}
