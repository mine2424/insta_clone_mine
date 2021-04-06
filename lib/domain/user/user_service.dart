import 'package:async/async.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:insta_clone/domain/user/models/user.dart';

class UserService {
  final _auth = FirebaseAuth.instance;

  Result<String> getCurrentUserUid() {
    if (_auth.currentUser == null) {
      return Result.error(AuthStatus.error);
    }
    return Result.value(_auth.currentUser!.uid);
  }

  Future<Result<String>> signUpEmail({
    required String email,
    required String password,
  }) async {
    UserCredential? user;

    try {
      user = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on Exception catch (e) {
      print(e);
      return Result.error(e);
    }

    return Result.value(user.user!.uid);
  }

  Future<Result<String>> loginEmail({
    required String email,
    required String password,
  }) async {
    UserCredential? user;

    try {
      user = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on Exception catch (e) {
      print(e);
      return Result.error(e);
    }

    return Result.value(user.user!.uid);
  }
}
