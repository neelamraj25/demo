import 'package:demo_applications/bloc/group_bloc.dart';
import 'package:demo_applications/respo/group_repository.dart';
import 'package:demo_applications/screen/group_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Group',
      home: BlocProvider(
        create: (_)=> GroupBloc(GroupRepository()),
        child: MyGroupeList(),
      ),
    );
  }
}

