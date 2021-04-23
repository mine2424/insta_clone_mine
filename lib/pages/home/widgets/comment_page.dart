import 'package:flutter/material.dart';
import 'package:insta_clone/common/constants/theme.dart';
import 'package:insta_clone/domain/post/models/comment.dart';
import 'package:insta_clone/pages/home/widgets/liker_item.dart';

class CommentPage extends StatelessWidget {
  const CommentPage({required this.comments});

  final List<Comment> comments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      // setState(() {
                      //   page = 1;
                      //   build(context);
                      // });
                    },
                  ),
                  Text(
                    'Comments',
                    style: TextStyleTheme.textStyleBold,
                  )
                ],
              ),
              IconButton(
                icon: Icon(
                  Icons.send,
                  color: Colors.black,
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return LikerItem(comment: comments[index]);
          },
        ),
      ),
    );
  }
}
