import 'package:flutter/material.dart';
import '../models/group_model.dart';

class ActiveGroupsTiles extends StatefulWidget {
  @override
  _ActiveGroupsTilesState createState() => _ActiveGroupsTilesState();
}

class _ActiveGroupsTilesState extends State<ActiveGroupsTiles> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          child: Container(
            height: 250,
            child: ListView.builder(
              itemCount: myGroups.length,
              itemBuilder: (context, index) {
                final Group group = myGroups[index];
                return GestureDetector(
                  onTap: () {},
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
                      color: group.isUnread ? Color(0XFF272727) : Color(0XFF141414),
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
                              backgroundImage: AssetImage(group.groupImageUrl),
                            ),
                            SizedBox(width: 10.0,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  group.groupName,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 5.0,),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.45,
                                  child: Text(
                                    group.lastText,
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
                              group.lastTextTime,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
//                              fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5.0,),
                            group.isUnread ? Container(
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
      ),
    );
  }
}
