import 'package:insta_clone/domain/user/user_repository.dart';
import 'package:insta_clone/domain/user/user_service.dart';
import 'package:insta_clone/pages/app/states/user_state.dart';
import 'package:state_notifier/state_notifier.dart';

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier({required this.repository, required this.service})
      : super(const UserState());

  UserRepository repository;
  UserService service;

  Future<void> addUser(String email, String password) async {
    final result = await service.signUpEmail(
      email: email,
      password: password,
    );

    if (result.isError) {
      // TODO: dialog表示
    }
  }

  Future<void> addUserInfo(
    String name,
    String userImage,
    String message,
  ) async {
    final getUidResult = service.getCurrentUserUid();

    if (getUidResult.isError) {
      // TODO: dialog表示
    }

    final uid = getUidResult.asValue!.value;

    final addUserResult =
        await repository.addUser(uid, name, userImage, message);

    if (addUserResult.isError) {
      // TODO: dialog表示
    }
  }
}
