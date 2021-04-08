import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:insta_clone/domain/post/models/post.dart';

part 'post_list.freezed.dart';
part 'post_list.g.dart';

@freezed
class PostList with _$PostList {
  const factory PostList({
    @Default(<Post>[]) List<Post> postList,
  }) = _PostList;

  factory PostList.fromJson(Map<String, dynamic> json) =>
      _$PostListFromJson(json);
}
