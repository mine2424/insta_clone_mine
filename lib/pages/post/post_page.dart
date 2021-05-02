import 'package:flutter/material.dart';
import 'package:insta_clone/common/constants/theme.dart';
import 'package:insta_clone/domain/user/models/user.dart';
import 'package:insta_clone/pages/home/home_notifier.dart';
import 'package:insta_clone/pages/home/states/home_state.dart';
import 'package:insta_clone/widgets/text_field/post_text_field.dart';

class PostPage extends StatelessWidget {
  const PostPage({
    required this.notifier,
    required this.state,
    required this.user,
  });

  final HomeNotifier notifier;
  final HomeState state;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instagram',
          style: TextStyleTheme.textStyleBold,
          textAlign: TextAlign.left,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
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
                onPressed: () async {
                  //TODO: userにuserImageが入っていない...
                  await notifier.addPost(user);
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
      ),
    );
  }
}
