import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';

import '../axios_exception.dart';

/// 请求处理拦截器
class RequestInterceptor extends Interceptor {

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    return super.onRequest(options, handler);
  }

  // 添加认证
  // 读取本地配置
  Map<String, dynamic>? getAuthorizationHeader() {
    Map<String, dynamic>? headers;
    // 从getx或者sputils中获取
    // String accessToken = Global.accessToken;
    String accessToken = "";
    headers = {
      'Authorization': 'Bearer $accessToken',
    };
    return headers;
  }
}