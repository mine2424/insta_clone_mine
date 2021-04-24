import 'dart:io';

import 'package:async/async.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:insta_clone/domain/user/models/user.dart';

class UserRepository {
  final _db = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  Future<Result<bool>> addUser({
    required String uid,
    required String name,
  }) async {
    final doc = _db.doc('/private/users/$uid/writeOnly/');

    try {
      doc.set(
        {
          'userId': uid,
          'name': name,
        },
        SetOptions(merge: true),
      );
    } catch (e) {
      return Result.error(e);
    }

    return Result.value(true);
  }

  Future<Result<bool>> addUserInfo({
    required String uid,
    String? userImage,
    String? message,
  }) async {
    final doc = _db.doc('/private/users/$uid/writeOnly/');

    try {
      doc.set(
        {
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

  Future<Result<String>> addUserImageToStorage(
    String path,
    File file,
  ) async {
    late final TaskSnapshot snapshot;

    try {
      snapshot = await _storage.ref(path).putFile(file);
    } on Exception catch (e) {
      //TODO PostRepositoryでのエラー判別を考える
      Result.error('error');
      print(e);
    }

    print(
      'In adduserImage, imagepath is : ${await snapshot.ref.getDownloadURL()}',
    );

    return Result.value(await snapshot.ref.getDownloadURL());
  }

  Future<Result<User>> fetchUser(String uid) async {
    DocumentSnapshot snapshot;

    final doc = _db.doc('/private/users/$uid/readOnly/');

    try {
      snapshot = await doc.get();
      print(snapshot.data()!);
    } catch (e) {
      print(e);
      return Result.error(e);
    }

    if (snapshot.exists) {
      return Result.value(User.fromJson(snapshot.data()!));
    }

    return Result.error('no data');
  }
}
