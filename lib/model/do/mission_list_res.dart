import 'package:metu_app/model/do/interface.dart';

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
    required this.info,
    required this.token,
  });

  LoginResponseInfo info;
  String token;

  factory MissionListResponseData.fromJson(Map<String, dynamic> json) => MissionListResponseData(
    info: LoginResponseInfo.fromJson(json["info"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "info": info.toJson(),
    "token": token,
  };
}

class LoginResponseInfo {
  LoginResponseInfo({
    required this.email,
    required this.phone,
    required this.roleIds,
    required this.userId,
    required this.username,
  });

  String email;
  String phone;
  String roleIds;
  int userId;
  String username;

  factory LoginResponseInfo.fromJson(Map<String, dynamic> json) => LoginResponseInfo(
    email: json["email"],
    phone: json["phone"],
    roleIds: json["roleIds"],
    userId: json["userId"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "phone": phone,
    "roleIds": roleIds,
    "userId": userId,
    "username": username,
  };
}