import 'package:demo_applications/model/group_model.dart';

abstract class GroupEvent {}

class FetchgGroup extends GroupEvent{
  final int userId;
  FetchgGroup(this.userId);
}


class AddGroup extends GroupEvent{
  final GroupModel groupData;
  AddGroup(this.groupData);
}