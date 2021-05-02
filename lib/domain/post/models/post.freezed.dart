// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
class _$PostTearOff {
  const _$PostTearOff();

  _Post call(
      {String id = '',
      String title = '',
      String content = '',
      String postImage = '',
      List<User> likes = const <User>[],
      List<Comment> comments = const <Comment>[],
      bool isLiked = false,
      bool isSaved = false,
      User? user}) {
    return _Post(
      id: id,
      title: title,
      content: content,
      postImage: postImage,
      likes: likes,
      comments: comments,
      isLiked: isLiked,
      isSaved: isSaved,
      user: user,
    );
  }

  Post fromJson(Map<String, Object> json) {
    return Post.fromJson(json);
  }
}

/// @nodoc
const $Post = _$PostTearOff();

/// @nodoc
mixin _$Post {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get postImage => throw _privateConstructorUsedError;
  List<User> get likes => throw _privateConstructorUsedError;
  List<Comment> get comments => throw _privateConstructorUsedError;
  bool get isLiked => throw _privateConstructorUsedError;
  bool get isSaved => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String title,
      String content,
      String postImage,
      List<User> likes,
      List<Comment> comments,
      bool isLiked,
      bool isSaved,
      User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$PostCopyWithImpl<$Res> implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  final Post _value;
  // ignore: unused_field
  final $Res Function(Post) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? postImage = freezed,
    Object? likes = freezed,
    Object? comments = freezed,
    Object? isLiked = freezed,
    Object? isSaved = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      postImage: postImage == freezed
          ? _value.postImage
          : postImage // ignore: cast_nullable_to_non_nullable
              as String,
      likes: likes == freezed
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<User>,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>,
      isLiked: isLiked == freezed
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaved: isSaved == freezed
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
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
abstract class _$PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$PostCopyWith(_Post value, $Res Function(_Post) then) =
      __$PostCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String title,
      String content,
      String postImage,
      List<User> likes,
      List<Comment> comments,
      bool isLiked,
      bool isSaved,
      User? user});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$PostCopyWithImpl<$Res> extends _$PostCopyWithImpl<$Res>
    implements _$PostCopyWith<$Res> {
  __$PostCopyWithImpl(_Post _value, $Res Function(_Post) _then)
      : super(_value, (v) => _then(v as _Post));

  @override
  _Post get _value => super._value as _Post;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? postImage = freezed,
    Object? likes = freezed,
    Object? comments = freezed,
    Object? isLiked = freezed,
    Object? isSaved = freezed,
    Object? user = freezed,
  }) {
    return _then(_Post(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      postImage: postImage == freezed
          ? _value.postImage
          : postImage // ignore: cast_nullable_to_non_nullable
              as String,
      likes: likes == freezed
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<User>,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>,
      isLiked: isLiked == freezed
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaved: isSaved == freezed
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
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
class _$_Post extends _Post with DiagnosticableTreeMixin {
  const _$_Post(
      {this.id = '',
      this.title = '',
      this.content = '',
      this.postImage = '',
      this.likes = const <User>[],
      this.comments = const <Comment>[],
      this.isLiked = false,
      this.isSaved = false,
      this.user})
      : super._();

  factory _$_Post.fromJson(Map<String, dynamic> json) =>
      _$_$_PostFromJson(json);

  @JsonKey(defaultValue: '')
  @override
  final String id;
  @JsonKey(defaultValue: '')
  @override
  final String title;
  @JsonKey(defaultValue: '')
  @override
  final String content;
  @JsonKey(defaultValue: '')
  @override
  final String postImage;
  @JsonKey(defaultValue: const <User>[])
  @override
  final List<User> likes;
  @JsonKey(defaultValue: const <Comment>[])
  @override
  final List<Comment> comments;
  @JsonKey(defaultValue: false)
  @override
  final bool isLiked;
  @JsonKey(defaultValue: false)
  @override
  final bool isSaved;
  @override
  final User? user;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Post(id: $id, title: $title, content: $content, postImage: $postImage, likes: $likes, comments: $comments, isLiked: $isLiked, isSaved: $isSaved, user: $user)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Post'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('postImage', postImage))
      ..add(DiagnosticsProperty('likes', likes))
      ..add(DiagnosticsProperty('comments', comments))
      ..add(DiagnosticsProperty('isLiked', isLiked))
      ..add(DiagnosticsProperty('isSaved', isSaved))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Post &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.postImage, postImage) ||
                const DeepCollectionEquality()
                    .equals(other.postImage, postImage)) &&
            (identical(other.likes, likes) ||
                const DeepCollectionEquality().equals(other.likes, likes)) &&
            (identical(other.comments, comments) ||
                const DeepCollectionEquality()
                    .equals(other.comments, comments)) &&
            (identical(other.isLiked, isLiked) ||
                const DeepCollectionEquality()
                    .equals(other.isLiked, isLiked)) &&
            (identical(other.isSaved, isSaved) ||
                const DeepCollectionEquality()
                    .equals(other.isSaved, isSaved)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(postImage) ^
      const DeepCollectionEquality().hash(likes) ^
      const DeepCollectionEquality().hash(comments) ^
      const DeepCollectionEquality().hash(isLiked) ^
      const DeepCollectionEquality().hash(isSaved) ^
      const DeepCollectionEquality().hash(user);

  @JsonKey(ignore: true)
  @override
  _$PostCopyWith<_Post> get copyWith =>
      __$PostCopyWithImpl<_Post>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PostToJson(this);
  }
}

abstract class _Post extends Post {
  const factory _Post(
      {String id,
      String title,
      String content,
      String postImage,
      List<User> likes,
      List<Comment> comments,
      bool isLiked,
      bool isSaved,
      User? user}) = _$_Post;
  const _Post._() : super._();

  factory _Post.fromJson(Map<String, dynamic> json) = _$_Post.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get content => throw _privateConstructorUsedError;
  @override
  String get postImage => throw _privateConstructorUsedError;
  @override
  List<User> get likes => throw _privateConstructorUsedError;
  @override
  List<Comment> get comments => throw _privateConstructorUsedError;
  @override
  bool get isLiked => throw _privateConstructorUsedError;
  @override
  bool get isSaved => throw _privateConstructorUsedError;
  @override
  User? get user => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PostCopyWith<_Post> get copyWith => throw _privateConstructorUsedError;
}
