import 'package:flutter/material.dart';
import 'package:insta_clone/domain/user/models/user.dart';
import 'package:insta_clone/domain/user/user_repository.dart';
import 'package:insta_clone/domain/user/user_service.dart';
import 'package:insta_clone/pages/app/states/user_state.dart';
import 'package:insta_clone/pages/sign_in/edit_profile_page.dart';
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

  void listenAuthStatus() {
    final result = service.getCurrentUserUid();

    if (result.isError) {
      state = state.copyWith(authStatus: AuthStatus.none);
    }
    state = state.copyWith(authStatus: AuthStatus.email);
  }

  Future<void> addUser(String name, String email, String password) async {
//     final result = await service.signUpEmail(
//       email: email,
//       password: password,
//     );
//
//     if (result.isError) {
//       // TODO: dialog表示
//       return;
//     }
//
//     final getUidResult = service.getCurrentUserUid();
//
//     final uid = getUidResult.asValue!.value;
//
//     final addUserResult = await repository.addUser(uid: uid, name: name);
//
//     if (addUserResult.isError) {
//       // TODO: dialog表示
//       return;
//     }

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EditProfilePage.wrapped(),
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
}
