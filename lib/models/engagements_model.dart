import 'group_model.dart';

class Engagement {
  String engagementId;
  Group engagementGroup;
  String engagementType;
  String engagementSubject;
  String time;
  bool isStarred;

  Engagement(this.engagementGroup, this.engagementType, this.engagementSubject, this.time);
}

final Engagement engagement1 = Engagement(group1, 'Meeting', 'UI Discussions meeting 1', '5:30 pm');
final Engagement engagement2 = Engagement(group2, 'Meeting', 'Startup ideas discussions meeting 1', '5:22 pm');

List<Engagement> engagements = [engagement1, engagement2];