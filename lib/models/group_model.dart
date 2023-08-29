import 'package:flutter/cupertino.dart';
import '../models/user_model.dart';
import '../models/message_model.dart';

class Group {
  String id;
  String groupName;
  String groupImageUrl;
  List<User> groupMembers;
  String lastTextTime;
  String lastText;
  bool isUnread;

  Group(this.id, this.groupName, this.groupImageUrl, this.groupMembers, this.lastTextTime, this.lastText, this.isUnread);
}

final List<Group> myGroups = [group1, group2, group3, group4];

final Group group1 = Group('1', 'TeamUp developers', 'assets/TeamUp.png', [currentUser, james], '7:37 pm', "This UI is looking decent enough, isn't it bro!!", true);
final Group group2 = Group('2', 'Flutter Developers', 'assets/flutter_developers.png', [currentUser, greg, sam, james, sophia], '5:30 pm', 'So what next??', true);
final Group group3 = Group('3', 'Startup Ideas', 'assets/startup_ideas.jpg', [currentUser, john, sophia, james], '5:10 pm', "So tomorrow we'll talk about the designs and logos.", false);
final Group group4 = Group('4', 'GSOC_2020', 'assets/gsoc.jpeg', [currentUser, james], '12:10 pm', "You have no idea how much time is this going to take.", true);


