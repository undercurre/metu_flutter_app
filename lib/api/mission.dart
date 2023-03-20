class MissionApi {
  static Future<LoginResponse?> login(LoginRequest loginRequestData) async {
    var res = await AxiosEntity.get('login', params: loginRequestData.toMap());
    LoginResponse resStrict = LoginResponse.fromJson(res);
    return resStrict;
  }
}