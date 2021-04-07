import 'package:flutter/material.dart';
import 'package:insta_clone/pages/app/user_notifier.dart';

import 'package:insta_clone/pages/sign_in/sign_in_page.dart';

import 'package:provider/provider.dart';

import 'package:insta_clone/di_container.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ...domainProviders,
          ...notifierProviders,
        ],
        child: ConfigPage(),
      ),
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
    // TODO: implement initState
    context.read<UserNotifier>().listenAuthStatus();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInPage.wrapped(),
      // body: InitialPage(), //SignInPage(),
    );
  }
}
