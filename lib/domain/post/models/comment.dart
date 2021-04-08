import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:insta_clone/domain/user/models/user.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

DateTime _dateTimeFromTimestamp(dynamic value) => (value as Timestamp).toDate();

const dateTimeKey = JsonKey(fromJson: _dateTimeFromTimestamp);

@freezed
class Comment with _$Comment {
  const factory Comment({
    @Default('') String comment,
    @Default('') String uid,
    @dateTimeKey DateTime? dateOfComment,
    @Default(false) bool isLiked,
    User? user,
  }) = _Comment;

  const Comment._();

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
