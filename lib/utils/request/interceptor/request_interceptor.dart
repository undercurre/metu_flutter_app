import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';

import '../axios_exception.dart';

/// 请求处理拦截器
class RequestInterceptor extends Interceptor {

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    return super.onRequest(options, handler);
  }
}