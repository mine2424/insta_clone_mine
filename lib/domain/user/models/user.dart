import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

enum AuthStatus {
  noData,
  error,
  waiting,
  none,
  anonymous,
  emailPending,
  email,
}

@freezed
class User with _$User {
  const factory User({
    @Default('') String id,
    @Default('') String name,
  }) = _User;

  const User._();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
