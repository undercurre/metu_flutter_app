import 'package:metu_app/model/do/interface.dart';

import '../entity/mission.dart';

class MissionListResponse implements Interface<MissionListResponseData> {

  MissionListResponse({required this.code, required this.msg, required this.data});

  @override
  MissionListResponseData data;

  @override
  int code;

  @override
  String msg;

  factory MissionListResponse.fromJson(Map<String, dynamic> json) => MissionListResponse(
      data: MissionListResponseData.fromJson(json["data"]),
      code: json["code"],
      msg: json["msg"]
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "msg": msg,
    "data": data.toJson()
  };
}

class MissionListResponseData {
  MissionListResponseData({
    required this.list,
  });

  List<Mission> list;

  factory MissionListResponseData.fromJson(Map<String, dynamic> json) => MissionListResponseData(
    list: json["list"].map<Mission>((json) => Mission.fromJson(json)).toList(),
  );

  Map<String, dynamic> toJson() => {
    "list": list
  };
}
