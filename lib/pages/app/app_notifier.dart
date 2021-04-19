import 'package:flutter/material.dart';
import 'package:insta_clone/pages/app/states/app_state.dart';
import 'package:state_notifier/state_notifier.dart';

class AppNotifier extends StateNotifier<AppState> {
  AppNotifier() : super(const AppState());

  final navigatorKey = GlobalKey<NavigatorState>();
}
