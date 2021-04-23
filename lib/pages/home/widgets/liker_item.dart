import 'package:flutter/material.dart';
import 'package:insta_clone/common/constants/theme.dart';
import 'package:insta_clone/domain/post/models/comment.dart';

class LikerItem extends StatelessWidget {
  const LikerItem({required this.comment});

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    int hoursAgo = (now.hour) - (comment.dateOfComment!.hour - 1);

    return Container(
      height: 45,
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
                        color: comment.isLiked ? Colors.black : Colors.white,
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
    );
  }
}
