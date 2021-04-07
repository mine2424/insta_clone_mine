import 'dart:io';

import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_state.freezed.dart';

File _userImageFile(dynamic file) => File(file);

const fileKey = JsonKey(fromJson: _userImageFile, toJson: _userImageFile);

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    @Default('') String name,
    @Default('') String email,
    @Default('') String password,
    @Default('') String userImage,
    @fileKey File? userImageFile,
    @Default('') String message,
  }) = _SignInState;
}
