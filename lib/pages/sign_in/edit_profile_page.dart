import 'package:flutter/material.dart';

import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:insta_clone/domain/user/user_repository.dart';
import 'package:insta_clone/domain/user/user_service.dart';
import 'package:insta_clone/pages/app/app_notifier.dart';
import 'package:insta_clone/pages/app/user_notifier.dart';
import 'package:provider/provider.dart';

import 'package:insta_clone/pages/home/home_page.dart';
import 'package:insta_clone/pages/sign_in/sign_in_notifier.dart';
import 'package:insta_clone/pages/sign_in/states/sign_in_state.dart';
import 'package:insta_clone/widgets/profile_image.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage();

  static Widget wrapped() {
    return MultiProvider(
      providers: [
        StateNotifierProvider<SignInNotifier, SignInState>(
          create: (context) {
            return SignInNotifier(
              repository: context.read<UserRepository>(),
              service: context.read<UserService>(),
              appNotifier: context.read<AppNotifier>(),
            );
          },
          child: const EditProfilePage(),
        ),
      ],
      child: const EditProfilePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select((SignInState value) => value);
    final notifier = context.read<SignInNotifier>();
    final userNotifier = context.read<UserNotifier>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'edit profile',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 32.0),
            GestureDetector(
              onTap: () => notifier.selectProfileImage(),
              child: UserProfileImage(
                radius: 80.0,
                profileImage: state.userImageFile,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: notifier.bioController,
                    decoration: InputDecoration(hintText: 'Bio'),
                    validator: (value) =>
                        value!.trim().isEmpty ? 'Bio cannot be empty.' : null,
                  ),
                  const SizedBox(height: 28.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 1.0,
                      onPrimary: Theme.of(context).primaryColor,
                      textStyle: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      await notifier.addUserInfo(
                        state.userImageFile,
                        notifier.bioController.text,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage.wrapped(),
                        ),
                      );
                    },
                    child: const Text(
                      'Let\' get started!',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
