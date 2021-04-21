import 'package:flutter/material.dart';
import 'package:insta_clone/domain/user/user_service.dart';
import 'package:insta_clone/pages/app/app_notifier.dart';

import 'package:provider/provider.dart';

import 'package:insta_clone/domain/user/models/user.dart';
import 'package:insta_clone/pages/app/states/user_state.dart';
import 'package:insta_clone/pages/sign_in/sign_in_page.dart';
import 'package:insta_clone/pages/app/user_notifier.dart';
import 'package:insta_clone/pages/home/home_page.dart';
import 'package:insta_clone/di_container.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...domainProviders,
        ...notifierProviders,
      ],
      child: _MaterialApp(),
    );
  }
}

class _MaterialApp extends StatelessWidget {
  const _MaterialApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      navigatorKey: context.watch<AppNotifier>().navigatorKey,
      debugShowCheckedModeBanner: false,
      home: ConfigPage(),
    );
  }
}

class ConfigPage extends StatefulWidget {
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      judgeAuthStatus();
    });
  }

  void judgeAuthStatus() async {
    final userNotifier = context.read<UserNotifier>();

    userNotifier.listenAuthStatus();

    final userState = context.read<UserState>();

    if (userState.userStatus == UserStatus.email) {
      final uid = context.read<UserService>().userId;

      await userNotifier.fetchUser(uid);
    }
  }

  @override
  Widget build(BuildContext context) {
    final userStatus = context.select((UserState value) => value).userStatus;

    return (userStatus == UserStatus.email)
        ? HomePage.wrapped()
        : SignInPage.wrapped();
  }
}
