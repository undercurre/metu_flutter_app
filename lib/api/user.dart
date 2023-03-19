import 'package:metu_app/config/index.dart';
import 'package:metu_app/model/do/login_req.dart';
import 'package:metu_app/utils/request/axios_entity.dart';

import '../model/do/login_res.dart';

class UserApi {
  static const baseUrl = 'https://example.com/api';

  static Future<LoginResponse?> login(LoginRequest loginRequestData) async {
    LoginResponse? res = await AxiosEntity.get<LoginRequest, LoginResponse>('login', params: loginRequestData);
    return res;
  }
}