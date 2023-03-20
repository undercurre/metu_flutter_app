class MissionUpdateRequest {

  int id;

  String missionname;

  String deadline;

  String? detail;

  int? status;

  MissionUpdateRequest(this.id, this.missionname, this.deadline, this.detail, this.status);

  Map<String, dynamic> toMap() => {
    'id': id,
    'missionname': missionname,
    'detail': detail,
    'deadline': deadline,
    'status': status
  };
}