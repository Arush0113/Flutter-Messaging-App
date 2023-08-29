import 'package:flutter/material.dart';
import '../models/message_model.dart';
import '../models/user_model.dart';


class ChatScreen extends StatefulWidget {
  static const routeName = '/chat-screen';

//  final User user;
//  ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  Widget _buildMessageComposer() {
    return Container(
      color: Colors.black,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      child: Row(
        children: <Widget>[
          SizedBox(width: 10.0,),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              hintText: 'Send a message...',
              fillColor: Colors.white,
              filled: true,
            ),
          )),
          IconButton(icon: Icon(Icons.photo_camera, color: Colors.white,), onPressed: () {}),
          IconButton(icon: Icon(Icons.send, color: Colors.white,), onPressed: () {}),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final User userData = ModalRoute.of(context).settings.arguments;

    Widget _buildMessage(Message message, bool isMe) {
      return Container(
        margin: isMe ? EdgeInsets.only(top: 7.0, bottom: 8.0, left: 80.0, right: 10.0) :  EdgeInsets.only(top: 7.0, bottom: 8.0, right: 80.0, left: 10.0),
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        decoration: BoxDecoration(
            color: isMe ? Color(0XFF254525) : Color(0XFF404040),
          borderRadius: isMe ? BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ) : BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
              topRight: Radius.circular(15),
          ),
        ),
        child: Column(
          crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: <Widget>[
            Text(message.time, style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),),
            Text(message.text),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(userData.name, style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w500,
        ),),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 12.0,),
                child: ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final Message message = messages[index];
                    bool isMe = message.sender.id == currentUser.id;
                    return _buildMessage(message, isMe);
                  },
                ),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}
