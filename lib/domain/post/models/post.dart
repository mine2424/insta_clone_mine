import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:insta_clone/domain/post/models/comment.dart';
import 'package:insta_clone/domain/user/models/user.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    @Default('') String id,
    @Default('') String title,
    @Default('') String content,
    @Default('') String postImage,
    @Default(<User>[]) List<User> likes,
    @Default(<Comment>[]) List<Comment> comments,
    @Default(false) bool isLiked,
    @Default(false) bool isSaved,
    User? user,
  }) = _Post;

  const Post._();

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
