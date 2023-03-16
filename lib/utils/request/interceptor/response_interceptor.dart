import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';

import '../axios_exception.dart';

/// 响应处理拦截器
class ResponseInterceptor extends Interceptor {

  @override
  Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async {
    return super.onResponse(response, handler);
  }
}