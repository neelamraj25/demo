

import 'package:demo_applications/model/group_model.dart';
import 'package:dio/dio.dart';

class GroupRepository {

  final Dio _dio=Dio();

  Future<List<GroupModel>> fetchgGroups(int userId)async{
   try{
     final response =await _dio.get("https://kpa.v3m.in/api/UserGroup/GetUserGroup?UserId=45");
        print('data--${response.data}');
   if(response.data is List){
     final data = response.data as List;

    return data.map((json)=>GroupModel.fromJson(json)).toList();
   }else{
    throw Exception("Unexpected");
   }
   }catch(e){
    throw Exception("Failed $e");
   }
  }


Future<void> addGroup(GroupModel group) async {
  try {
    final response = await _dio.post(
      "https://kpa.v3m.in/api/UserGroup/AddUpdateUserGroup",
      data: group.toJson(),
    );
    print("Response: ${response.data}");
  } catch (e) {
    print("API Error: $e");
    rethrow; 
  }
}

}
