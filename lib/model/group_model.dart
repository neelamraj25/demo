class GroupModel {
  String groupId;
  String groupCode;
  String groupName;
  String totalMembers;
  String totalMonths;
  String startDate;
  String endDate;
  String amount;
  GroupType groupType;
  String groupStatus;
  dynamic createdBy;
  String createdDate;
  dynamic updatedBy;
  dynamic updatedDate;
  String isGroupAdmin;
  String groupAdmin;

  GroupModel({
    required this.groupId,
    required this.groupCode,
    required this.groupName,
    required this.totalMembers,
    required this.totalMonths,
    required this.startDate,
    required this.endDate,
    required this.amount,
    required this.groupType,
    required this.groupStatus,
    required this.createdBy,
    required this.createdDate,
    required this.updatedBy,
    required this.updatedDate,
    required this.isGroupAdmin,
    required this.groupAdmin,
  });

  factory GroupModel.fromJson(Map<String, dynamic> json) {
    return GroupModel(
      groupId: json['groupId'].toString(),
      groupCode: json['groupCode'].toString(),
      groupName: json['groupName'].toString(),
      totalMembers: json['totalMembers'].toString(),
      totalMonths: json['totalMonths'].toString(),
      startDate: json['startDate'].toString(),
      endDate: json['endDate'].toString(),
      amount: json['amount'].toString(),
      groupType: GroupTypeExtension.fromString(json['groupType']),
      groupStatus: json['groupStatus'].toString(),
      createdBy: json['createdBy'],
      createdDate: json['createdDate'].toString(),
      updatedBy: json['updatedBy'],
      updatedDate: json['updatedDate']?.toString(),
      isGroupAdmin: json['isGroupAdmin'].toString(),
      groupAdmin: json['groupAdmin'].toString(),
    );
  }

 Map<String, dynamic> toJson() {
  return {
    'groupId': groupId,
    'groupCode': groupCode,
    'groupName': groupName,
    'totalMembers': totalMembers,
    'totalMonths': totalMonths,
    'startDate': startDate,
    'endDate': endDate,
    'amount': amount,
    'groupType': groupType.name,
    'groupStatus': groupStatus,
    'createdBy': createdBy,
    'createdDate': createdDate,
    'updatedBy': updatedBy,
    'isGroupAdmin': isGroupAdmin,
    'groupAdmin': groupAdmin,
  };
}

}

enum GroupType { random, maunal }

extension GroupTypeExtension on GroupType {
  String get name => this == GroupType.random ? "Random" : "Manual";

  static GroupType fromString(String value) {
    return value.toLowerCase() == 'manual'
        ? GroupType.maunal
        : GroupType.random;
  }
}
