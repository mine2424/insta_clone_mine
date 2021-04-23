// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    userId: json['userId'] as String? ?? '',
    name: json['name'] as String? ?? '',
    message: json['message'] as String? ?? '',
    userImage: json['userImage'] as String? ?? '',
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'message': instance.message,
      'userImage': instance.userImage,
    };
