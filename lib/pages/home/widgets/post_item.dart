import 'package:flutter/material.dart';
import 'package:insta_clone/common/constants/theme.dart';
import 'package:insta_clone/domain/post/models/post.dart';
import 'package:insta_clone/pages/home/widgets/comment_page.dart';

class PostItem extends StatelessWidget {
  const PostItem({required this.post, required this.index});

  final Post post;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(post.user!.userImage),
                    ),
                  ),
                  Text(
                    post.user!.name,
                  )
                ],
              ),
              IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: () {},
              )
            ],
          ),
        ),
        Container(
          constraints: BoxConstraints.expand(height: 1),
          color: Colors.grey,
        ),
        Container(
          constraints: BoxConstraints(maxHeight: 282),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                post.postImage,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Stack(
                  alignment: Alignment(0, 0),
                  children: <Widget>[
                    Icon(
                      Icons.favorite,
                      size: 30,
                      color: post.isLiked ? Colors.red : Colors.black,
                    ),
                    IconButton(
                      icon: Icon(Icons.favorite),
                      color: post.isLiked ? Colors.red : Colors.white,
                      onPressed: () {
                        // setState(() {
                        //   userPosts[index].isLiked =
                        //       post.isLiked ? false : true;
                        //   if (!post.isLiked) {
                        //     post.likes.remove(user);
                        //   } else {
                        //     post.likes.add(user);
                        //   }
                        // });
                      },
                    )
                  ],
                ),
                Stack(
                  alignment: Alignment(0, 0),
                  children: <Widget>[
                    Icon(
                      Icons.mode_comment,
                      size: 30,
                      color: Colors.black,
                    ),
                    IconButton(
                      icon: Icon(Icons.mode_comment),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return CommentPage(comments: post.comments);
                            },
                          ),
                        );
                      },
                    )
                  ],
                ),
                Stack(
                  alignment: Alignment(0, 0),
                  children: <Widget>[
                    Icon(
                      Icons.send,
                      size: 30,
                      color: Colors.black,
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      color: Colors.white,
                      onPressed: () {},
                    )
                  ],
                )
              ],
            ),
          ],
        ),
        FlatButton(
          child: Text(
            post.likes.length.toString() + " likes",
            style: TextStyleTheme.textStyleBold,
          ),
          onPressed: () {
            // setState(() {
            //   the_post = post;
            //   page = 2;
            //   build(context);
            // });
          },
        ),
        Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 15, right: 10),
              child: Text(
                post.user!.name,
                style: TextStyleTheme.textStyleBold,
              ),
            ),
            Text(
              post.content,
              style: TextStyleTheme.textStyle,
            )
          ],
        ),
        FlatButton(
          child: Text(
            "View all " + post.comments.length.toString() + " comments",
            style: TextStyleTheme.textStyleLigthGrey,
          ),
          onPressed: () {
            // setState(() {
            //   the_post = post;
            //   page = 3;
            //   build(context);
            // });
          },
        ),
      ],
    ));
  }
}
