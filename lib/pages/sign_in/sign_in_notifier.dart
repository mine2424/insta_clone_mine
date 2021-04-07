import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:state_notifier/state_notifier.dart';

import 'package:insta_clone/pages/sign_in/states/sign_in_state.dart';

class SignInNotifier extends StateNotifier<SignInState> {
  SignInNotifier() : super(const SignInState());

  void saveName(String value) {
    state = state.copyWith(name: value);
  }

  void saveEmail(String value) {
    state = state.copyWith(email: value);
  }

  void savePassword(String value) {
    state = state.copyWith(password: value);
  }

  void saveMessage(String value) {
    state = state.copyWith(message: value);
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
