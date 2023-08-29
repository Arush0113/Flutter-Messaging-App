import 'package:flutter/material.dart';
//import 'package:team_up/models/message_model.dart';
import '../widgets/favorite_contacts.dart';
import '../widgets/recent_chats.dart';

import '../widgets/category_selector.dart';

class ChatHomeScreen extends StatefulWidget {

  static const routeName = '/chat-home-screen';

  @override
  _ChatHomeScreenState createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text(
          'Chats',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          CategorySelector(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
//                borderRadius: BorderRadius.only(
//                  topLeft: Radius.circular(40.0),
//                  topRight: Radius.circular(40.0),
//                ),
              ),
              child: Column(
                children: <Widget>[
//                  FavoriteContacts(),
                  RecentChats(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
