import 'package:flutter/material.dart';

import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:insta_clone/pages/home/states/home_state.dart';
import 'package:provider/provider.dart';

import 'package:insta_clone/domain/post/post_repository.dart';
import 'package:insta_clone/pages/app/states/user_state.dart';
import 'package:insta_clone/pages/home/home_notifier.dart';

class CreatePostPage extends StatelessWidget {
  const CreatePostPage._();

  static Widget wrapped() {
    return MultiProvider(
      providers: [
        StateNotifierProvider<HomeNotifier, HomeState>(
          create: (context) => HomeNotifier(
            postRepository: context.read<PostRepository>(),
          ),
          child: const CreatePostPage._(),
        ),
      ],
      child: const CreatePostPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserState value) => value).user;
    final state = context.select((HomeState value) => value);
    final notifier = context.read<HomeNotifier>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '新規投稿',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.close, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () => notifier.setImageFromGallery(),
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              width: double.infinity,
              color: Colors.grey[200],
              child: (state.postImageFile == null)
                  ? const Icon(
                      Icons.image,
                      color: Colors.grey,
                      size: 120.0,
                    )
                  : Image.file(
                      state.postImageFile!,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: InputDecoration(hintText: '内容'),
                  onChanged: (value) => notifier.saveContent(value),
                  validator: (value) =>
                      value!.trim().isEmpty ? 'Caption cannot be empty.' : null,
                ),
                const SizedBox(height: 28.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 1.0,
                    textStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () async {
                    await context.read<HomeNotifier>().addPost(user);

                    Navigator.of(context).pop();
                  },
                  child: const Text('Post'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
