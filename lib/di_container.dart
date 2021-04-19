import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:insta_clone/domain/post/models/post_list.dart';
import 'package:insta_clone/domain/post/post_repository.dart';
import 'package:insta_clone/domain/post/post_service.dart';
import 'package:insta_clone/domain/user/user_repository.dart';
import 'package:insta_clone/domain/user/user_service.dart';
import 'package:insta_clone/pages/app/app_notifier.dart';
import 'package:insta_clone/pages/app/post_notifier.dart';
import 'package:insta_clone/pages/app/states/app_state.dart';
import 'package:insta_clone/pages/app/states/user_state.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';

import 'package:insta_clone/pages/app/user_notifier.dart';

List<SingleChildWidget> get domainProviders {
  return <SingleChildWidget>[
    Provider<UserRepository>(
      create: (_) => UserRepository(),
    ),
    Provider<UserService>(
      create: (_) => UserService(),
    ),
    Provider<PostRepository>(
      create: (_) => PostRepository(),
    ),
    Provider<PostService>(
      create: (_) => PostService(),
    )
  ];
}

List<SingleChildWidget> get notifierProviders {
  return <SingleChildWidget>[
    StateNotifierProvider<AppNotifier, AppState>(
      create: (_) => AppNotifier(),
    ),
    StateNotifierProvider<UserNotifier, UserState>(
      create: (context) => UserNotifier(
        appNotifier: context.read<AppNotifier>(),
        repository: context.read<UserRepository>(),
        service: context.read<UserService>(),
        context: context,
      ),
    ),
    StateNotifierProvider<PostNotifier, PostList>(
      create: (context) => PostNotifier(
        postRepository: context.read<PostRepository>(),
      ),
    ),
  ];
}
