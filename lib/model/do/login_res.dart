import 'package:metu_app/model/do/interface.dart';

class LoginResponse implements Interface<LoginResponseData> {
  @override
  late final LoginResponseData data;

  @override
  late final int code;

  @override
  late final String msg;

  LoginResponse({required LoginResponseData data, required code, required msg});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    data: LoginResponseData.fromJson(json["data"]),
    code: json["code"],
    msg: json["msg"]
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "msg": msg,
    "data": data.toJson()
  };
}

class LoginResponseData {
  LoginResponseData({
    required this.info,
    required this.token,
  });

  LoginResponseInfo info;
  String token;

  factory LoginResponseData.fromJson(Map<String, dynamic> json) => LoginResponseData(
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