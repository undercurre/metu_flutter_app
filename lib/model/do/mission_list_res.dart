import 'package:metu_app/model/do/interface.dart';
import 'package:metu_app/utils/logger/index.dart';
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
    required this.page,
    required this.size,
    required this.total
  });

  List<Mission> list;
  int page;
  int size;
  int total;

  factory MissionListResponseData.fromJson(Map<String, dynamic> json) => MissionListResponseData(
    list: json["list"].map<Mission>((json) {
      Console.log(json["userId"]);
      return Mission.fromJson(json);
    }).toList(),
    page: json["page"],
    size: json["size"],
    total: json["total"]
  );

  Map<String, dynamic> toJson() => {
    "list": list,
    "page": page,
    "size": size,
    "total": total
  };
}
