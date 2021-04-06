import 'package:flutter/material.dart';

import 'package:insta_clone/app.dart';
import 'pages/home/home.dart';
import 'pages/notification/notifications.dart';
import 'pages/profile/profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: App(), // MyHomePage(),
    );
  }
}
