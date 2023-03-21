class MissionUpdateRequest {

  int missionId;

  String missionName;

  String deadline;

  String? detail;

  int? status;

  MissionUpdateRequest(this.missionId, this.missionName, this.deadline, this.detail, this.status);

  Map<String, dynamic> toMap() => {
    'missionId': missionId,
    'missionName': missionName,
    'detail': detail,
    'deadline': deadline,
    'status': status
  };
}