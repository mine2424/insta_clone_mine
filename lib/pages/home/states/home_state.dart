import 'dart:io';

import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

File _userImageFile(dynamic file) => File(file);

const fileKey = JsonKey(fromJson: _userImageFile, toJson: _userImageFile);

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @fileKey File? postImageFile,
    @Default('') String postImage,
  }) = _HomeState;
}
