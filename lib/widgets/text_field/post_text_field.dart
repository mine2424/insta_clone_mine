import 'package:flutter/material.dart';

class PostTextField extends StatelessWidget {
  const PostTextField({
    required this.controller,
    this.hintText = 'input',
  });

  final TextEditingController controller;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFFBDBDBD),
        ),
      ),
    );
  }
}
