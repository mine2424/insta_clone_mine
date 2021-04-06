import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:insta_clone/domain/user/user_repository.dart';
import 'package:insta_clone/domain/user/user_service.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';

import 'package:insta_clone/pages/app/user_notifier.dart';

List<SingleChildWidget> get domainProviders {
  return <SingleChildWidget>[
    Provider<UserRepository>(
      create: (context) => UserRepository(),
    ),
    Provider<UserService>(
      create: (context) => UserService(),
    )
  ];
}

List<SingleChildWidget> get notifierProviders {
  return <SingleChildWidget>[
    StateNotifierProvider(
      create: (context) => UserNotifier(
        repository: context.read<UserRepository>(),
        service: context.read<UserService>(),
      ),
    )
  ];
}
