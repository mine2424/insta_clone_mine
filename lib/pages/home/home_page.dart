import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:insta_clone/domain/post/models/comment.dart';
import 'package:insta_clone/pages/home/create_post_page.dart';
import 'package:insta_clone/common/constants/theme.dart';
import 'package:insta_clone/domain/post/models/post.dart';
import 'package:insta_clone/domain/post/models/post_list.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    final state = context.select((PostList value) => value);
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
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => CreatePostPage.wrapped(),
              ),
            );
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
          child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Column(
                children: getPosts(context, state),
              )
            ],
          )
        ],
      )),
    );
  }

  List<Widget> getPosts(BuildContext context, PostList state) {
    List<Widget> posts = [];
    int index = 0;
    // TODO: firestoreのpostのデータを挿入
    for (var post in state.postList) {
      posts.add(getPost(context, post, index));
      index++;
    }
    return posts;
  }

  Widget getPost(BuildContext context, Post post, int index) {
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
                      onPressed: () {},
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

  // ページ遷移させるのでstateless classにしておく
  Widget getComments(List<Comment> likes) {
    List<Widget> likers = [];
    DateTime now = DateTime.now();
    for (Comment comment in likes) {
      int hoursAgo = (now.hour) - (comment.dateOfComment!.hour - 1);
      likers.add(
        Container(
          // height: 45,
          padding: EdgeInsets.all(10),
          child: FlatButton(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      width: 30,
                      height: 30,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(comment.user!.userImage),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: comment.user!.name,
                                  style: TextStyleTheme.textStyleBold),
                              TextSpan(text: ' '),
                              TextSpan(
                                text: comment.comment,
                                style: TextStyleTheme.textStyle,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 10, top: 20),
                              child: Text(
                                hoursAgo.toString() + "h",
                                style: TextStyleTheme.textStyleLigthGrey,
                              ),
                            ),
                            Container(
                              child: Text(
                                "like",
                                style: TextStyleTheme.textStyleLigthGrey,
                              ),
                              margin: EdgeInsets.only(right: 10, top: 20),
                            ),
                            Container(
                              child: Text(
                                "Reply",
                                style: TextStyleTheme.textStyleLigthGrey,
                              ),
                              margin: EdgeInsets.only(right: 10, top: 20),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Stack(
                  alignment: Alignment(0, 0),
                  children: <Widget>[
                    Container(
                        child: Icon(
                      Icons.favorite,
                      color: Colors.black,
                      size: 15,
                    )),
                    Container(
                      child: IconButton(
                        icon: Icon(Icons.favorite,
                            color:
                                comment.isLiked ? Colors.black : Colors.white,
                            size: 10),
                        onPressed: () {
                          // setState(() {
                          //   comment.isLiked = comment.isLiked ? false : true;
                          // });
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
            onPressed: () {},
          ),
        ),
      );
    }

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
        child: ListView(
          children: likers,
        ),
      ),
    );
  }
}
