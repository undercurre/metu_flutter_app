import 'package:metu_app/model/do/login_req.dart';
import 'package:metu_app/utils/logger/index.dart';
import 'package:metu_app/utils/request/axios_entity.dart';

import '../model/do/login_res.dart';

class UserApi {
  static Future<LoginResponse?> login(LoginRequest loginRequestData) async {
    LoginResponse? res = await AxiosEntity.get<LoginResponse>('login', params: loginRequestData.toMap());
    Console.log('请求完成');
    return res;
  }
}