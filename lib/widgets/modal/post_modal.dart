import 'dart:io';
import 'package:flutter/material.dart';

import 'package:insta_clone/pages/home/home_notifier.dart';
import 'package:insta_clone/widgets/modal/modal_base.dart';
import 'package:insta_clone/widgets/text_field/post_text_field.dart';

class PostModal extends ModalBase<void> {
  const PostModal({
    required this.notifier,
    required this.postImageFile,
  });

  final HomeNotifier notifier;
  final File? postImageFile;

  @override
  Widget modalContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 32),
          GestureDetector(
            onTap: () => notifier.setImageFromGallery(),
            child: Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width / 1.2,
              color: Colors.grey[200],
              child: (postImageFile == null)
                  ? const Icon(Icons.image, color: Colors.grey, size: 120.0)
                  : Image.file(postImageFile!, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: PostTextField(
              hintText: 'message',
              controller: notifier.messageController,
            ),
          ),
        ],
      ),
    );
  }
}
