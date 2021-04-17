import 'dart:io';

import 'package:async/async.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:insta_clone/domain/post/models/comment.dart';
import 'package:insta_clone/domain/post/models/post.dart';
import 'package:insta_clone/domain/user/models/user.dart';

class PostRepository {
  final _db = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  Future<String> addPostImageToStorage(
    String path,
    File file,
  ) async {
    final snapshot = await _storage.ref(path).putFile(file);

    return snapshot.ref.getDownloadURL();
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
          'uid': user.id,
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
    }

    var list = <Post>[];

    if (data.docs.isEmpty) {
      // TODO(mine2424): エラー処理作成
      return Result.error('error');
    }

    for (var item in data.docs) {
      final doc = item.data();

      list.add(Post.fromJson(doc));
    }

    return Result.value(list);
  }

  Future<void> addComment({
    required String dateId,
    required String postId,
    required Map<String, dynamic> comment,
  }) async {
    final doc = _db.doc('public/posts/$dateId/$postId');

    try {
      await doc.set(
        {
          'comment': comment,
          'createAt': FieldValue.serverTimestamp(),
        },
        SetOptions(merge: true),
      );
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<void> editComment({
    required String dateId,
    required String postId,
    required String comment,
    required String dateOfComment,
    required int like,
    required String uid,
  }) async {
    final doc = _db.doc('public/posts/$dateId/$postId');

    try {
      await doc.update({'comment': comment});
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<void> deleteComment({
    required String dateId,
    required String postId,
    required List<Comment> list,
  }) async {
    final doc = _db.doc('public/posts/$dateId/$postId');

    try {
      await doc.set({'comment': list});
    } on Exception catch (e) {
      print(e);
    }
  }
}
