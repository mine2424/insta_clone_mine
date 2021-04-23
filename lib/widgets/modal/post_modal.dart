import 'package:flutter/material.dart';

import 'package:insta_clone/domain/user/models/user.dart';
import 'package:insta_clone/pages/home/home_notifier.dart';
import 'package:insta_clone/pages/home/states/home_state.dart';
import 'package:insta_clone/widgets/modal/modal_base.dart';
import 'package:insta_clone/widgets/text_field/post_text_field.dart';

class PostModal extends ModalBase<void> {
  const PostModal({
    required this.user,
    required this.notifier,
    required this.state,
  });

  final User user;
  final HomeNotifier notifier;
  final HomeState state;

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
              //TODO: 画像が変化しない
              child: (state.postImageFile == null)
                  ? const Icon(Icons.image, color: Colors.grey, size: 120.0)
                  : Image.file(state.postImageFile!, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: PostTextField(
              hintText: 'message',
              controller: notifier.messageController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 1.0,
                onPrimary: Theme.of(context).primaryColor,
                textStyle: TextStyle(color: Colors.white),
              ),
              onPressed: (state.postImageFile == null)
                  ? null
                  : () {
                      notifier.addPost(user);
                      Navigator.of(context).pop();
                    },
              child: const Text(
                'share',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
