import 'package:flutter/material.dart';

import 'package:insta_clone/pages/home/home.dart';
import 'package:insta_clone/pages/notification/notifications.dart';
import 'package:insta_clone/pages/profile/profile.dart';

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  List<Widget> pages = [HomePage(), NotificationsPage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        body: TabBarView(
          children: pages,
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(bottom: 20),
          child: new TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                icon: Icon(Icons.favorite),
              ),
              Tab(
                icon: Icon(Icons.perm_identity),
              ),
            ],
            unselectedLabelColor: Colors.black,
            labelColor: Colors.blue,
            indicatorColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
