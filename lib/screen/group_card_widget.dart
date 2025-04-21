import 'package:demo_applications/model/group_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GroupCard extends StatelessWidget {
  final GroupModel groupData;
  const GroupCard({super.key, required this.groupData});

  @override
  Widget build(BuildContext context) {
    String formatDate(String dateString) {
      try {
        DateTime parsedDate = DateFormat(
          "d/M/yyyy h:mm:ss a",
        ).parse(dateString);
        return DateFormat("dd MMM yyyy").format(parsedDate);
      } catch (e) {
        return dateString;
      }
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (groupData.isGroupAdmin == '1')
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 55, 109, 55),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: const Text(
                'Admin',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          const SizedBox(height: 6),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage(''),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        groupData.groupName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color.fromARGB(255, 114, 14, 7),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '-',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 2,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  size: 16,
                                  color: Color.fromARGB(255, 114, 14, 7),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  "${formatDate(groupData.startDate)} - ${formatDate(groupData.endDate)}",
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Color.fromARGB(255, 114, 14, 7),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 2,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.currency_rupee,
                                  size: 16,
                                  color: Color.fromARGB(255, 114, 14, 7),
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  groupData.amount,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Color.fromARGB(255, 114, 14, 7),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 2,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.group,
                                  size: 16,
                                  color: Color.fromARGB(255, 114, 14, 7),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  groupData.totalMembers,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Color.fromARGB(255, 114, 14, 7),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 114, 14, 7),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(),
                ),
                onPressed: () {},
                child: const Text(
                  "Next Meeting",
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
              ),

              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 11,
                  ),
                  decoration: BoxDecoration(color: Colors.grey),
                  child: Row(
                    children: const [
                      Text(
                        "Meeting No.: 16",
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                      Spacer(),
                      Text(
                        "Date: 9 Apr 2025",
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
