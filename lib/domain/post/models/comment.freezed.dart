// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return _Comment.fromJson(json);
}

/// @nodoc
class _$CommentTearOff {
  const _$CommentTearOff();

  _Comment call(
      {String comment = '',
      String uid = '',
      @dateTimeKey DateTime? dateOfComment,
      bool isLiked = false,
      User? user}) {
    return _Comment(
      comment: comment,
      uid: uid,
      dateOfComment: dateOfComment,
      isLiked: isLiked,
      user: user,
    );
  }

  Comment fromJson(Map<String, Object> json) {
    return Comment.fromJson(json);
  }
}

/// @nodoc
const $Comment = _$CommentTearOff();

/// @nodoc
mixin _$Comment {
  String get comment => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  @dateTimeKey
  DateTime? get dateOfComment => throw _privateConstructorUsedError;
  bool get isLiked => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentCopyWith<Comment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentCopyWith<$Res> {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) then) =
      _$CommentCopyWithImpl<$Res>;
  $Res call(
      {String comment,
      String uid,
      @dateTimeKey DateTime? dateOfComment,
      bool isLiked,
      User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$CommentCopyWithImpl<$Res> implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._value, this._then);

  final Comment _value;
  // ignore: unused_field
  final $Res Function(Comment) _then;

  @override
  $Res call({
    Object? comment = freezed,
    Object? uid = freezed,
    Object? dateOfComment = freezed,
    Object? isLiked = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfComment: dateOfComment == freezed
          ? _value.dateOfComment
          : dateOfComment // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isLiked: isLiked == freezed
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }

  @override
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$CommentCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$CommentCopyWith(_Comment value, $Res Function(_Comment) then) =
      __$CommentCopyWithImpl<$Res>;
  @override
  $Res call(
      {String comment,
      String uid,
      @dateTimeKey DateTime? dateOfComment,
      bool isLiked,
      User? user});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$CommentCopyWithImpl<$Res> extends _$CommentCopyWithImpl<$Res>
    implements _$CommentCopyWith<$Res> {
  __$CommentCopyWithImpl(_Comment _value, $Res Function(_Comment) _then)
      : super(_value, (v) => _then(v as _Comment));

  @override
  _Comment get _value => super._value as _Comment;

  @override
  $Res call({
    Object? comment = freezed,
    Object? uid = freezed,
    Object? dateOfComment = freezed,
    Object? isLiked = freezed,
    Object? user = freezed,
  }) {
    return _then(_Comment(
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfComment: dateOfComment == freezed
          ? _value.dateOfComment
          : dateOfComment // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isLiked: isLiked == freezed
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Comment extends _Comment with DiagnosticableTreeMixin {
  const _$_Comment(
      {this.comment = '',
      this.uid = '',
      @dateTimeKey this.dateOfComment,
      this.isLiked = false,
      this.user})
      : super._();

  factory _$_Comment.fromJson(Map<String, dynamic> json) =>
      _$_$_CommentFromJson(json);

  @JsonKey(defaultValue: '')
  @override
  final String comment;
  @JsonKey(defaultValue: '')
  @override
  final String uid;
  @override
  @dateTimeKey
  final DateTime? dateOfComment;
  @JsonKey(defaultValue: false)
  @override
  final bool isLiked;
  @override
  final User? user;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Comment(comment: $comment, uid: $uid, dateOfComment: $dateOfComment, isLiked: $isLiked, user: $user)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Comment'))
      ..add(DiagnosticsProperty('comment', comment))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('dateOfComment', dateOfComment))
      ..add(DiagnosticsProperty('isLiked', isLiked))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Comment &&
            (identical(other.comment, comment) ||
                const DeepCollectionEquality()
                    .equals(other.comment, comment)) &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.dateOfComment, dateOfComment) ||
                const DeepCollectionEquality()
                    .equals(other.dateOfComment, dateOfComment)) &&
            (identical(other.isLiked, isLiked) ||
                const DeepCollectionEquality()
                    .equals(other.isLiked, isLiked)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(comment) ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(dateOfComment) ^
      const DeepCollectionEquality().hash(isLiked) ^
      const DeepCollectionEquality().hash(user);

  @JsonKey(ignore: true)
  @override
  _$CommentCopyWith<_Comment> get copyWith =>
      __$CommentCopyWithImpl<_Comment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CommentToJson(this);
  }
}

abstract class _Comment extends Comment {
  const factory _Comment(
      {String comment,
      String uid,
      @dateTimeKey DateTime? dateOfComment,
      bool isLiked,
      User? user}) = _$_Comment;
  const _Comment._() : super._();

  factory _Comment.fromJson(Map<String, dynamic> json) = _$_Comment.fromJson;

  @override
  String get comment => throw _privateConstructorUsedError;
  @override
  String get uid => throw _privateConstructorUsedError;
  @override
  @dateTimeKey
  DateTime? get dateOfComment => throw _privateConstructorUsedError;
  @override
  bool get isLiked => throw _privateConstructorUsedError;
  @override
  User? get user => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CommentCopyWith<_Comment> get copyWith =>
      throw _privateConstructorUsedError;
}
