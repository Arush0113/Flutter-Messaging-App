import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/message_model.dart';
import '../screens/chat_screen.dart';

class FavoriteContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(ChatScreen.routeName),
      child: Container(
        margin: EdgeInsets.only(
          top: 5.0,
          bottom: 5.0,
          right: 20.0,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Favorite Contacts',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.more_horiz,
                      ),
                      color: Colors.blueGrey,
                      iconSize: 27.0,
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              Container(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: favorites.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 27.0,
                            backgroundImage:
                                AssetImage(favorites[index].imageUrl),
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            favorites[index].name,
                            style: TextStyle(color: Colors.blueGrey),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
