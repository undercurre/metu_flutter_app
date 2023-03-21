import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';
import 'package:metu_app/utils/storage/index.dart';

import '../axios_exception.dart';

/// 请求处理拦截器
class RequestInterceptor extends Interceptor {

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // 处理请求头
    options = options.copyWith(headers: headerHandler(options.headers));
    return super.onRequest(options, handler);
  }

  /// 设置请求头
  Map<String, dynamic> headerHandler(Map<String, dynamic>? header) {
    // 设置token
    // 从getx或者sputils中获取
    // String accessToken = Global.accessToken;
    String accessToken = LocalStorage.getItem('token') ?? '';
    if (header != null) {
      header['Authorization'] = 'Bearer $accessToken';
    } else {
      header = {};
    }
    return header;
  }
}