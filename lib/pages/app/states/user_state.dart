import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:insta_clone/domain/user/models/user.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(AuthStatus.waiting) AuthStatus authStatus,
    @Default(User()) User user,
  }) = _UserState;
}
