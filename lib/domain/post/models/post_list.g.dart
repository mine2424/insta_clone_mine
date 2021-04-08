// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostList _$_$_PostListFromJson(Map<String, dynamic> json) {
  return _$_PostList(
    postList: (json['postList'] as List<dynamic>?)
            ?.map((e) => Post.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$_$_PostListToJson(_$_PostList instance) =>
    <String, dynamic>{
      'postList': instance.postList,
    };
