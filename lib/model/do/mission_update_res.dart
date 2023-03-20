import 'package:metu_app/model/do/interface.dart';

class MissionUpdateResponse implements Interface<MissionUpdateResponseData> {

  MissionUpdateResponse({required this.code, required this.msg, required this.data});

  @override
  MissionUpdateResponseData data;

  @override
  int code;

  @override
  String msg;

  factory MissionUpdateResponse.fromJson(Map<String, dynamic> json) => MissionUpdateResponse(
      data: MissionUpdateResponseData.fromJson(json["data"]),
      code: json["code"],
      msg: json["msg"]
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "msg": msg,
    "data": data.toJson()
  };
}

class MissionUpdateResponseData {
  MissionUpdateResponseData({
    required this.id,
    required this.missionname,
    required this.deadline
  });

  int id;
  String missionname;
  String deadline;

  factory MissionUpdateResponseData.fromJson(Map<String, dynamic> json) => MissionUpdateResponseData(
    id: json["id"],
    missionname: json["missionname"],
    deadline: json["deadline"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "missionname": missionname,
    "deadline": deadline
  };
}