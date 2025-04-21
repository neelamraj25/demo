import 'package:demo_applications/bloc/group_bloc.dart';
import 'package:demo_applications/bloc/group_event.dart';
import 'package:demo_applications/bloc/group_state.dart';
import 'package:demo_applications/screen/group_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyGroupeList extends StatefulWidget {
  const MyGroupeList({super.key});

  @override
  State<MyGroupeList> createState() => _MyGroupeListState();
}

class _MyGroupeListState extends State<MyGroupeList> {
  @override
  void initState() {
    context.read<GroupBloc>().add(FetchgGroup(45));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back, color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 114, 14, 7),
        title: Text(
          'My Group',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<GroupBloc, GroupState>(
        builder: (context, state) {
          if(state is GroupLoading){
            return const Center(child: CircularProgressIndicator(),);
          }else if(state is GroupLoaded){
            if(state.groups.isEmpty){
              return Text("No groups found");
            }
          return ListView.builder(
            itemCount: state.groups.length,
            padding: EdgeInsets.all(12),
            itemBuilder: (context, index) {
              final group = state.groups[index];
              return GroupCard(groupData: group,);
            },
          );}else if(state is GroupError){
            return Center(child: Text(state.message));
          }else{
            return Center(child: Text("Welcome to groups"));
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text("New Group"),
        icon: Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 114, 14, 7),
      ),
    );
  }
}
