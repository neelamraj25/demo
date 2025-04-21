import 'package:demo_applications/model/group_model.dart';

abstract class GroupState {}

class GroupInitial extends GroupState{}
class GroupLoading extends GroupState{}

class GroupLoaded extends GroupState{
  final List<GroupModel> groups;
  GroupLoaded(this.groups);
}


class GroupAdded extends GroupState{}

class GroupError extends GroupState{
final String message;
GroupError(this.message);
}


