import 'package:demo_applications/model/group_model.dart';
import 'package:flutter/material.dart';

class GroupCard extends StatelessWidget {
  final GroupModel groupData;
  const GroupCard({super.key,required this.groupData});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Row(
              children: [
                CircleAvatar(radius: 24, backgroundImage: NetworkImage('')),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    groupData.groupName,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              if(groupData.isGroupAdmin=='1')  Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    'Admin',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Icon(Icons.calendar_month, color: Colors.grey[700], size: 18),
                const SizedBox(width: 4),
                Text("${groupData.startDate} - ${groupData!.endDate}"),
                Spacer(),
                Icon(Icons.currency_rupee, size: 18, color: Colors.grey[700]),
                Text(groupData.amount),
                const SizedBox(width: 4),
                Icon(Icons.group, size: 18, color: Colors.grey[700]),
                Text(groupData.totalMembers),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 114, 14, 7),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  onPressed: () {},
                  child: const Text("Next Meeting"),
                ),
                  const SizedBox(width: 8),
                  Expanded(child: Row(
                    children: [
                      Text("Meeting No.: 16",style: TextStyle(color: Colors.grey),),
                      Spacer(),
                       Text("Date.: 16-03-200",style: TextStyle(color: Colors.grey),),
                    ],
                  ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
