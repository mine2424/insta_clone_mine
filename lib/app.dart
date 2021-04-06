import 'package:flutter/material.dart';
import 'package:insta_clone/pages/initial_page.dart';
import 'package:insta_clone/pages/sign_in/sign_in_page.dart';

import 'package:provider/provider.dart';

import 'package:insta_clone/di_container.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...domainProviders,
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInPage(),
      // body: InitialPage(), //SignInPage(),
    );
  }
}
