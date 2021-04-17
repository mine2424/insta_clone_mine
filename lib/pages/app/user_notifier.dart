import 'package:flutter/material.dart';
import 'package:insta_clone/domain/user/models/user.dart';
import 'package:insta_clone/domain/user/user_repository.dart';
import 'package:insta_clone/domain/user/user_service.dart';
import 'package:insta_clone/pages/app/states/user_state.dart';
import 'package:insta_clone/pages/home/home_page.dart';
import 'package:state_notifier/state_notifier.dart';

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier({
    required this.repository,
    required this.service,
    required this.context,
  }) : super(const UserState());

  UserRepository repository;
  UserService service;
  final BuildContext context;

  String getCurrentUserUid() {
    final uidResult = service.getCurrentUserUid();

    if (uidResult.isError) {
      // TODO: dialog表示
    }

    return uidResult.asValue!.value;
  }

  void listenAuthStatus() {
    final result = service.getCurrentUserUid();

    if (result.isError) {
      state = state.copyWith(authStatus: AuthStatus.none);
      return;
    }
    state = state.copyWith(authStatus: AuthStatus.email);
    print(result.asValue!.value);
  }

  Future<void> addUser(String name, String email, String password) async {
    final result = await service.signUpEmail(
      email: email,
      password: password,
    );

    if (result.isError) {
      // TODO: dialog表示
      return;
    }

    final uid = getCurrentUserUid();

    final addUserResult = await repository.addUser(uid: uid, name: name);

    if (addUserResult.isError) {
      // TODO: dialog表示
      return;
    }

    fetchUser(uid);

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => HomePage(),
      ),
    );
  }

  Future<void> addUserInfo(
    String name,
    String userImage,
    String message,
  ) async {
    final getUidResult = service.getCurrentUserUid();

    if (getUidResult.isError) {
      return;

      // TODO: dialog表示
    }

    final uid = getUidResult.asValue!.value;

    final addUserResult = await repository.addUser(
      name: name,
      uid: uid,
      message: message,
      userImage: userImage,
    );

    if (addUserResult.isError) {
      return;

      // TODO: dialog表示
    }
  }

  Future<void> fetchUser(String uid) async {
    final uid = getCurrentUserUid();

    final userResult = await repository.fetchUser(uid);

    if (userResult.isError) {
      // TODO: dialog表示
      return;
    }

    final user = userResult.asValue!.value;

    state = state.copyWith(user: user);
  }
}
