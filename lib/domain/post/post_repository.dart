import 'dart:io';
import 'package:async/async.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:insta_clone/domain/post/error/post_error.dart';
import 'package:insta_clone/domain/post/models/post.dart';
import 'package:insta_clone/domain/user/models/user.dart';

class PostRepository {
  final _db = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  Future<Result<String>> addPostImageToStorage(
    String path,
    File file,
  ) async {
    late final TaskSnapshot snapshot;

    try {
      snapshot = await _storage.ref(path).putFile(file);
    } on Exception catch (e) {
      //TODO PostRepositoryでのエラー判別を考える
      Result.error(PostError.error);
      print(e);
    }

    return Result.value(await snapshot.ref.getDownloadURL());
  }

  Future<void> addPost({
    required String dateId,
    required String postId,
    required String content,
    required String postImage,
    required User user,
  }) async {
    final doc = _db.doc('public/posts/$dateId/$postId');

    try {
      await doc.set({
        'content': content,
        'postImage': postImage,
        'user': {
          'name': user.name,
          'uid': user.userId,
          'userImage': user.userImage,
        },
        'createAt': FieldValue.serverTimestamp(),
      });
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<void> editPost({
    required String dateId,
    required String postId,
    required String title,
    required String content,
    required String postImage,
  }) async {
    final doc = _db.doc('public/posts/$dateId/$postId');

    try {
      await doc.update(
        {
          'title': title,
          'content': content,
          'postImage': postImage,
        },
      );
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<void> deletePost({
    required String dateId,
    required String postId,
  }) async {
    final doc = _db.doc('public/posts/$dateId/$postId');

    try {
      await doc.delete();
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<Result<List<Post>>> fetchPost({required String dateId}) async {
    final doc = _db.collection('public/posts/$dateId/');

    late QuerySnapshot data;

    try {
      data = await doc.get();
    } on Exception catch (e) {
      print(e);
      return Result.error(PostError.error);
    }

    var list = <Post>[];

    if (data.docs.isEmpty) {
      return Result.error(PostError.noData);
    }

    for (var item in data.docs) {
      final doc = item.data();

      list.add(Post.fromJson(doc));
    }

    return Result.value(list);
  }
}
