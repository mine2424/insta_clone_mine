// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'post_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PostListTearOff {
  const _$PostListTearOff();

  _PostList call({List<Post> postList = const <Post>[]}) {
    return _PostList(
      postList: postList,
    );
  }
}

/// @nodoc
const $PostList = _$PostListTearOff();

/// @nodoc
mixin _$PostList {
  List<Post> get postList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostListCopyWith<PostList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostListCopyWith<$Res> {
  factory $PostListCopyWith(PostList value, $Res Function(PostList) then) =
      _$PostListCopyWithImpl<$Res>;
  $Res call({List<Post> postList});
}

/// @nodoc
class _$PostListCopyWithImpl<$Res> implements $PostListCopyWith<$Res> {
  _$PostListCopyWithImpl(this._value, this._then);

  final PostList _value;
  // ignore: unused_field
  final $Res Function(PostList) _then;

  @override
  $Res call({
    Object? postList = freezed,
  }) {
    return _then(_value.copyWith(
      postList: postList == freezed
          ? _value.postList
          : postList // ignore: cast_nullable_to_non_nullable
              as List<Post>,
    ));
  }
}

/// @nodoc
abstract class _$PostListCopyWith<$Res> implements $PostListCopyWith<$Res> {
  factory _$PostListCopyWith(_PostList value, $Res Function(_PostList) then) =
      __$PostListCopyWithImpl<$Res>;
  @override
  $Res call({List<Post> postList});
}

/// @nodoc
class __$PostListCopyWithImpl<$Res> extends _$PostListCopyWithImpl<$Res>
    implements _$PostListCopyWith<$Res> {
  __$PostListCopyWithImpl(_PostList _value, $Res Function(_PostList) _then)
      : super(_value, (v) => _then(v as _PostList));

  @override
  _PostList get _value => super._value as _PostList;

  @override
  $Res call({
    Object? postList = freezed,
  }) {
    return _then(_PostList(
      postList: postList == freezed
          ? _value.postList
          : postList // ignore: cast_nullable_to_non_nullable
              as List<Post>,
    ));
  }
}

/// @nodoc
class _$_PostList extends _PostList with DiagnosticableTreeMixin {
  const _$_PostList({this.postList = const <Post>[]}) : super._();

  @JsonKey(defaultValue: const <Post>[])
  @override
  final List<Post> postList;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PostList(postList: $postList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PostList'))
      ..add(DiagnosticsProperty('postList', postList));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PostList &&
            (identical(other.postList, postList) ||
                const DeepCollectionEquality()
                    .equals(other.postList, postList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(postList);

  @JsonKey(ignore: true)
  @override
  _$PostListCopyWith<_PostList> get copyWith =>
      __$PostListCopyWithImpl<_PostList>(this, _$identity);
}

abstract class _PostList extends PostList {
  const factory _PostList({List<Post> postList}) = _$_PostList;
  const _PostList._() : super._();

  @override
  List<Post> get postList => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PostListCopyWith<_PostList> get copyWith =>
      throw _privateConstructorUsedError;
}
