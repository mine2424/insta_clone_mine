import 'dart:io';

import 'package:flutter/material.dart';

class UserProfileImage extends StatelessWidget {
  final double radius;

  final File? profileImage;

  const UserProfileImage({
    Key? key,
    required this.radius,
    this.profileImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.grey[200],
      backgroundImage: profileImage != null
          ? FileImage(profileImage!) as ImageProvider
          : null,
      child: _noProfileIcon(),
    );
  }

  Icon? _noProfileIcon() {
    if (profileImage == null) {
      return Icon(
        Icons.account_circle,
        color: Colors.grey[400],
        size: radius * 2,
      );
    }
    return null;
  }
}
