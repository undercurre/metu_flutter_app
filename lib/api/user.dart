import 'package:metu_app/model/do/login_req.dart';
import 'package:metu_app/utils/logger/index.dart';
import 'package:metu_app/utils/request/axios_entity.dart';

import '../model/do/login_res.dart';

class UserApi {
  static Future<LoginResponse?> login(LoginRequest loginRequestData) async {
    var res = await AxiosEntity.get('login', params: loginRequestData.toMap());
    LoginResponse resStrict = LoginResponse.fromJson(res);
    return resStrict;
  }
}