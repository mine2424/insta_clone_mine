import 'package:flutter/material.dart';
import 'package:insta_clone/pages/app/states/app_state.dart';
import 'package:state_notifier/state_notifier.dart';

class AppNotifier extends StateNotifier<AppState> {
  AppNotifier() : super(const AppState());

  final navigatorKey = GlobalKey<NavigatorState>();

  Future<T?>? pushAndRemoveAll<T extends Object?>(Route<T> newRoute) {
    return navigatorKey.currentState
        ?.pushAndRemoveUntil(newRoute, (route) => false);
  }

  Future<T?>? pushReplacement<T extends Object?, TO extends Object?>(
    Route<T> newRoute, {
    TO? result,
  }) {
    return navigatorKey.currentState
        ?.pushReplacement<T, TO>(newRoute, result: result);
  }
}
