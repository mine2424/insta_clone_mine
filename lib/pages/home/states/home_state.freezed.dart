// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomeStateTearOff {
  const _$HomeStateTearOff();

  _HomeState call({@fileKey File? postImageFile, String postImage = ''}) {
    return _HomeState(
      postImageFile: postImageFile,
      postImage: postImage,
    );
  }
}

/// @nodoc
const $HomeState = _$HomeStateTearOff();

/// @nodoc
mixin _$HomeState {
  @fileKey
  File? get postImageFile => throw _privateConstructorUsedError;
  String get postImage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
  $Res call({@fileKey File? postImageFile, String postImage});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;

  @override
  $Res call({
    Object? postImageFile = freezed,
    Object? postImage = freezed,
  }) {
    return _then(_value.copyWith(
      postImageFile: postImageFile == freezed
          ? _value.postImageFile
          : postImageFile // ignore: cast_nullable_to_non_nullable
              as File?,
      postImage: postImage == freezed
          ? _value.postImage
          : postImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(
          _HomeState value, $Res Function(_HomeState) then) =
      __$HomeStateCopyWithImpl<$Res>;
  @override
  $Res call({@fileKey File? postImageFile, String postImage});
}

/// @nodoc
class __$HomeStateCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(_HomeState _value, $Res Function(_HomeState) _then)
      : super(_value, (v) => _then(v as _HomeState));

  @override
  _HomeState get _value => super._value as _HomeState;

  @override
  $Res call({
    Object? postImageFile = freezed,
    Object? postImage = freezed,
  }) {
    return _then(_HomeState(
      postImageFile: postImageFile == freezed
          ? _value.postImageFile
          : postImageFile // ignore: cast_nullable_to_non_nullable
              as File?,
      postImage: postImage == freezed
          ? _value.postImage
          : postImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
class _$_HomeState with DiagnosticableTreeMixin implements _HomeState {
  const _$_HomeState({@fileKey this.postImageFile, this.postImage = ''});

  @override
  @fileKey
  final File? postImageFile;
  @JsonKey(defaultValue: '')
  @override
  final String postImage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeState(postImageFile: $postImageFile, postImage: $postImage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomeState'))
      ..add(DiagnosticsProperty('postImageFile', postImageFile))
      ..add(DiagnosticsProperty('postImage', postImage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HomeState &&
            (identical(other.postImageFile, postImageFile) ||
                const DeepCollectionEquality()
                    .equals(other.postImageFile, postImageFile)) &&
            (identical(other.postImage, postImage) ||
                const DeepCollectionEquality()
                    .equals(other.postImage, postImage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(postImageFile) ^
      const DeepCollectionEquality().hash(postImage);

  @JsonKey(ignore: true)
  @override
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState({@fileKey File? postImageFile, String postImage}) =
      _$_HomeState;

  @override
  @fileKey
  File? get postImageFile => throw _privateConstructorUsedError;
  @override
  String get postImage => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
