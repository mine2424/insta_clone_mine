import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

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
      child: MaterialApp(
        title: 'Instagram',
        debugShowCheckedModeBanner: false,
        home: ConfigPage(),
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
    return HomePage();
    // body: InitialPage(), //SignInPage(),
  }
}
