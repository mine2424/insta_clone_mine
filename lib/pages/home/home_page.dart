import 'package:flutter/material.dart';

import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:insta_clone/pages/app/user_notifier.dart';
import 'package:provider/provider.dart';

import 'package:insta_clone/common/constants/theme.dart';
import 'package:insta_clone/domain/post/post_repository.dart';
import 'package:insta_clone/pages/app/app_notifier.dart';
import 'package:insta_clone/pages/app/states/user_state.dart';
import 'package:insta_clone/pages/home/home_notifier.dart';
import 'package:insta_clone/pages/home/states/home_state.dart';
import 'package:insta_clone/pages/home/widgets/post_item.dart';
import 'package:insta_clone/domain/post/models/post_list.dart';
import 'package:insta_clone/widgets/modal/post_modal.dart';

class HomePage extends StatelessWidget {
  const HomePage._();

  static Widget wrapped() {
    return MultiProvider(
      providers: [
        StateNotifierProvider<HomeNotifier, HomeState>(
          create: (context) => HomeNotifier(
            postRepository: context.read<PostRepository>(),
            appNotifier: context.read<AppNotifier>(),
            userNotifier: context.read<UserNotifier>(),
          ),
          child: const HomePage._(),
        ),
      ],
      child: const HomePage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final notifier = context.read<HomeNotifier>();
    final postList = context.watch<PostList>().postList;
    final user = context.select((UserState value) => value).user;
    final state = context.watch<HomeState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Instagram",
          style: TextStyleTheme.textStyleBold,
          textAlign: TextAlign.left,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.add_box_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            PostModal(
              user: user,
              notifier: notifier,
              state: state,
            ).show(context);
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: postList.length,
        itemBuilder: (context, index) {
          return PostItem(
            post: postList[index],
            index: index,
          );
        },
      ),
    );
  }
}
