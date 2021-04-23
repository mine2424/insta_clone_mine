import 'package:async/async.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:insta_clone/domain/user/models/user.dart';

class UserRepository {
  final _db = FirebaseFirestore.instance;

  Future<Result<bool>> addUser({
    required String uid,
    required String name,
    String? userImage,
    String? message,
  }) async {
    final doc = _db.doc('/private/users/$uid/writeOnly/');

    try {
      doc.set(
        {
          'userId': uid,
          'name': name,
          'userImage': userImage,
          'message': message,
        },
        SetOptions(merge: true),
      );
    } catch (e) {
      return Result.error(e);
    }

    return Result.value(true);
  }

  Future<Result<User>> fetchUser(String uid) async {
    DocumentSnapshot snapshot;

    final doc = _db.doc('/private/users/$uid/readOnly/');

    try {
      snapshot = await doc.get();
    } catch (e) {
      return Result.error(e);
    }

    if (snapshot.exists) {
      return Result.value(User.fromJson(snapshot.data()!));
    }

    return Result.error('no data');
  }
}
