import 'package:flutter/material.dart';
import '../models/message_model.dart';
import '../screens/chat_screen.dart';


class RecentChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
//                    height: 300.0,
        decoration: BoxDecoration(
          color: Colors.black,
//          color: Color(0XFF252525),
//          borderRadius: BorderRadius.only(
//            topLeft: Radius.circular(40.0),
//            topRight: Radius.circular(40.0),
//          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
//            topLeft: Radius.circular(40.0),
//            topRight: Radius.circular(40.0),
          ),
          child: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) {
              final Message chat = chats[index];
              return GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(ChatScreen.routeName, arguments: chat.sender),
                child: Container(
                  margin: EdgeInsets.only(
                    top: 5.0,
                    bottom: 5.0,
                    right: 10.0,
                    left: 10.0,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0
                  ),
                  decoration: BoxDecoration(
                    color: chat.unread ? Color(0XFF272727) : Color(0XFF141414),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 27,
                            backgroundImage: AssetImage(chat.sender.imageUrl),
                          ),
                          SizedBox(width: 10.0,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                chat.sender.name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 5.0,),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: Text(
                                  chat.text,
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            chat.time,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
//                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.0,),
                          chat.unread ? Container(
                            width: 40.0,
                            height: 20.0,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            alignment: Alignment.center,
                            child: Text('NEW',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ) : SizedBox.shrink(),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
