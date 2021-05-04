import 'package:flutter/material.dart';

import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:insta_clone/domain/user/user_repository.dart';
import 'package:insta_clone/domain/user/user_service.dart';
import 'package:insta_clone/pages/app/app_notifier.dart';
import 'package:provider/provider.dart';

import 'package:insta_clone/pages/sign_in/edit_profile_page.dart';
import 'package:insta_clone/domain/user/models/user.dart';

import 'package:insta_clone/pages/sign_in/sign_in_notifier.dart';
import 'package:insta_clone/pages/sign_in/states/sign_in_state.dart';

class SignInPage extends StatelessWidget {
  const SignInPage();

  static Widget wrapped() {
    return MultiProvider(
      providers: [
        StateNotifierProvider<SignInNotifier, SignInState>(
          create: (context) => SignInNotifier(
            repository: context.read<UserRepository>(),
            service: context.read<UserService>(),
            appNotifier: context.read<AppNotifier>(),
          ),
          child: const SignInPage(),
        ),
      ],
      child: const SignInPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final notifier = context.read<SignInNotifier>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
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
                      controller: notifier.nameController,
                      validator: (value) => value!.trim().isEmpty
                          ? 'Please enter a valid username.'
                          : null,
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Email'),
                      controller: notifier.emailController,
                      validator: (value) => value!.contains('@')
                          ? null
                          : 'Please enter a valid email.',
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Password'),
                      controller: notifier.passwordController,
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
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          final status = await notifier.addUser(
                            notifier.nameController.text,
                            notifier.emailController.text,
                            notifier.passwordController.text,
                          );

                          if (status == UserStatus.success) {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => EditProfilePage.wrapped(),
                              ),
                            );
                          }
                        }
                      },
                    ),
                    const SizedBox(height: 12.0),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
