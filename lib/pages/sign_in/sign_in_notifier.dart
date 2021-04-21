import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:state_notifier/state_notifier.dart';

import 'package:insta_clone/pages/sign_in/states/sign_in_state.dart';

class SignInNotifier extends StateNotifier<SignInState> {
  SignInNotifier() : super(const SignInState());

  late final nameController = TextEditingController();
  late final emailController = TextEditingController();
  late final passwordController = TextEditingController();
  late final bioController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  void selectProfileImage() async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      state = state.copyWith(userImageFile: File(pickedFile.path));
    }
  }
}
