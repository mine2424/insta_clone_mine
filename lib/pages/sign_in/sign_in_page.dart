import 'package:flutter/material.dart';

import 'package:flutter_state_notifier/flutter_state_notifier.dart';

import 'package:insta_clone/pages/app/user_notifier.dart';
import 'package:insta_clone/pages/sign_in/sign_in_notifier.dart';
import 'package:insta_clone/pages/sign_in/states/sign_in_state.dart';

import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  const SignInPage();

  static Widget wrapped() {
    return MultiProvider(
      providers: [
        StateNotifierProvider<SignInNotifier, SignInState>(
          create: (context) => SignInNotifier(),
          child: const SignInPage(),
        ),
      ],
      child: const SignInPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final notifier = context.read<SignInNotifier>();
    final state = context.select((SignInState value) => value);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Instagram',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Username'),
                    onChanged: (value) => notifier.saveName(value),
                    validator: (value) => value!.trim().isEmpty
                        ? 'Please enter a valid username.'
                        : null,
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Email'),
                    onChanged: (value) => notifier.saveEmail(value),
                    validator: (value) => !value!.contains('@')
                        ? 'Please enter a valid email.'
                        : null,
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Password'),
                    onChanged: (value) => notifier.savePassword(value),
                    obscureText: true,
                    validator: (value) => value!.length < 6
                        ? 'Must be at least 6 characters.'
                        : null,
                  ),
                  const SizedBox(height: 28.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 1.0,
                      textStyle: TextStyle(
                        color: Colors.white,
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                    ),
                    child: const Text('Sign Up'),
                    onPressed: () {
                      context.read<UserNotifier>().addUser(
                            state.name,
                            state.email,
                            state.password,
                          );
                    },
                  ),
                  const SizedBox(height: 12.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
