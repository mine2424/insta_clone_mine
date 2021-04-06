import 'package:flutter/material.dart';
import 'user.dart';
import 'post.dart';
import 'comment.dart';
import 'appbar.dart';

TextStyle textStyle = TextStyle(fontFamily: 'Gotham');
TextStyle textStyleBold = TextStyle(
    fontFamily: 'Gotham', fontWeight: FontWeight.bold, color: Colors.black);
TextStyle textStyleLigthGrey =
    TextStyle(fontFamily: 'Gotham', color: Colors.grey);
// AppbarParams appBarParams =  AppbarParams("Instagram", []);

Post post1 = Post(
  AssetImage('lib/assets/photo_1.jpeg'),
  user,
  "My first post",
  DateTime.now(),
  [follower1, follower2, follower3],
  [],
  false,
  false,
);
final User user = User(
  'kallehallden',
  AssetImage('lib/assets/my_profile.jpg'),
  [follower1, follower2, follower3],
  [follower1, follower2, follower3, follower4, follower5, follower6],
  [],
  [],
  false,
);
User follower1 = User(
  'the_rock',
  AssetImage('lib/assets/follower3.jpeg'),
  [],
  [],
  [],
  [],
  true,
);
User follower2 = User(
  'miley_cyrus',
  AssetImage('lib/assets/follower2.jpg'),
  [],
  [],
  [],
  [],
  false,
);
User follower3 = User(
  'kim_k',
  AssetImage('lib/assets/their_profile.jpeg'),
  [],
  [],
  [],
  [],
  true,
);
User follower4 = User(
  'daredevil',
  AssetImage('lib/assets/profile3.png'),
  [],
  [],
  [],
  [],
  true,
);
User follower5 = User(
  'batman',
  AssetImage('lib/assets/profile6.jpg'),
  [],
  [],
  [],
  [],
  true,
);
User follower6 = User(
  'peter_griffin',
  AssetImage('lib/assets/profile4.png'),
  [],
  [],
  [],
  [],
  false,
);
List<Post> userPosts = [
  Post(
    AssetImage('lib/assets/photo_1.jpeg'),
    user,
    "My first post",
    DateTime.now(),
    [follower1, follower2, follower3, follower4, follower5, follower6],
    [
      Comment(follower1, "This was amazing!", DateTime.now(), false),
      Comment(follower2, "Cool one", DateTime.now(), false),
      Comment(
          follower4,
          "This is no good at all \nbuddy, don't post this stuff",
          DateTime.now(),
          false)
    ],
    false,
    false,
  ),
  Post(
      AssetImage('lib/assets/post2.jpg'),
      follower1,
      "This is such a great post though",
      DateTime.now(),
      [user, follower2, follower3, follower4, follower5],
      [
        Comment(follower3, "This was super cool!", DateTime.now(), false),
        Comment(follower1, "I can't believe it's not \nbutter!", DateTime.now(),
            false),
        Comment(user, "I know rite!", DateTime.now(), false),
        Comment(follower5, "I'm batman", DateTime.now(), false)
      ],
      false,
      false),
  Post(
      AssetImage('lib/assets/photo4.jpg'),
      follower5,
      "How did I even take this photo??",
      DateTime.now(),
      [user, follower2, follower3, follower4, follower5],
      [
        Comment(follower3, "This was super cool!", DateTime.now(), false),
        Comment(follower1, "I can't believe it's not \nbutter!", DateTime.now(),
            false),
        Comment(user, "I know rite!", DateTime.now(), false),
        Comment(follower5, "I'm batman", DateTime.now(), false)
      ],
      false,
      false),
  Post(
      AssetImage('lib/assets/photo5.jpg'),
      follower3,
      "Found this in my backyard. \nThought I'd post it jk lol lol lolol",
      DateTime.now(),
      [user, follower2, follower3, follower4, follower5],
      [
        Comment(follower3, "This was super cool!", DateTime.now(), false),
        Comment(follower1, "I can't believe it's not \nbutter!", DateTime.now(),
            false),
        Comment(user, "I know rite!", DateTime.now(), false),
        Comment(follower5, "I'm batman", DateTime.now(), false)
      ],
      false,
      false),
  Post(
      AssetImage('lib/assets/photo5.jpg'),
      follower3,
      "Found this in my backyard. \nThought I'd post it jk lol lol lolol",
      DateTime.now(),
      [user, follower2, follower3, follower4, follower5],
      [
        Comment(follower3, "This was super cool!", DateTime.now(), false),
        Comment(follower1, "I can't believe it's not \nbutter!", DateTime.now(),
            false),
        Comment(user, "I know rite!", DateTime.now(), false),
        Comment(follower5, "I'm batman", DateTime.now(), false)
      ],
      false,
      false),
  Post(
      AssetImage('lib/assets/photo5.jpg'),
      follower3,
      "Found this in my backyard. \nThought I'd post it jk lol lol lolol",
      DateTime.now(),
      [user, follower2, follower3, follower4, follower5],
      [
        Comment(follower3, "This was super cool!", DateTime.now(), false),
        Comment(follower1, "I can't believe it's not \nbutter!", DateTime.now(),
            false),
        Comment(user, "I know rite!", DateTime.now(), false),
        Comment(follower5, "I'm batman", DateTime.now(), false)
      ],
      false,
      false),
  Post(
      AssetImage('lib/assets/photo5.jpg'),
      follower3,
      "Found this in my backyard. \nThought I'd post it jk lol lol lolol",
      DateTime.now(),
      [user, follower2, follower3, follower4, follower5],
      [
        Comment(follower3, "This was super cool!", DateTime.now(), false),
        Comment(follower1, "I can't believe it's not \nbutter!", DateTime.now(),
            false),
        Comment(user, "I know rite!", DateTime.now(), false),
        Comment(follower5, "I'm batman", DateTime.now(), false)
      ],
      false,
      false),
  Post(
      AssetImage('lib/assets/photo5.jpg'),
      follower3,
      "Found this in my backyard. \nThought I'd post it jk lol lol lolol",
      DateTime.now(),
      [user, follower2, follower3, follower4, follower5],
      [
        Comment(follower3, "This was super cool!", DateTime.now(), false),
        Comment(follower1, "I can't believe it's not \nbutter!", DateTime.now(),
            false),
        Comment(user, "I know rite!", DateTime.now(), false),
        Comment(follower5, "I'm batman", DateTime.now(), false)
      ],
      false,
      false),
  Post(
      AssetImage('lib/assets/photo5.jpg'),
      follower3,
      "Found this in my backyard. \nThought I'd post it jk lol lol lolol",
      DateTime.now(),
      [user, follower2, follower3, follower4, follower5],
      [
        Comment(follower3, "This was super cool!", DateTime.now(), false),
        Comment(follower1, "I can't believe it's not \nbutter!", DateTime.now(),
            false),
        Comment(user, "I know rite!", DateTime.now(), false),
        Comment(follower5, "I'm batman", DateTime.now(), false)
      ],
      false,
      false),
];

String title = "Instagram";
