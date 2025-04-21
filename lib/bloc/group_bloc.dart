
import 'package:demo_applications/bloc/group_event.dart';
import 'package:demo_applications/bloc/group_state.dart';
import 'package:demo_applications/respo/group_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupBloc extends Bloc<GroupEvent,GroupState> {
  final GroupRepository repository;

  GroupBloc(this.repository): super(GroupInitial()){
    on<FetchgGroup>(_onFetchGroups);
     on<AddGroup>(_onAddGroup);
  }

  Future<void> _onFetchGroups(FetchgGroup event,Emitter<GroupState> emit) async{
    emit(GroupLoading());
    try{
      final groups=await repository.fetchgGroups(event.userId);
      print('group $groups');
      emit(GroupLoaded(groups));
    }
     catch(e){
  print('Error fetching groups: $e');
  emit(GroupError('Failed to fetch groups'));


    }
  }

  Future<void> _onAddGroup(AddGroup event,Emitter<GroupState> emit) async{
  emit(GroupLoading());
  try{
    await repository.addGroup(event.groupData);
    emit(GroupAdded());
  }catch(e){
    emit(GroupError('Failed to add group'));
  }
  }
}