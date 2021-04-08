// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Comment _$_$_CommentFromJson(Map<String, dynamic> json) {
  return _$_Comment(
    comment: json['comment'] as String? ?? '',
    uid: json['uid'] as String? ?? '',
    dateOfComment: _dateTimeFromTimestamp(json['dateOfComment']),
    isLiked: json['isLiked'] as bool? ?? false,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'comment': instance.comment,
      'uid': instance.uid,
      'dateOfComment': instance.dateOfComment?.toIso8601String(),
      'isLiked': instance.isLiked,
      'user': instance.user,
    };
