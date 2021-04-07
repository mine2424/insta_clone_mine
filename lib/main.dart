import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:insta_clone/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Firebase
  await Firebase.initializeApp();

  runApp(App());
}
