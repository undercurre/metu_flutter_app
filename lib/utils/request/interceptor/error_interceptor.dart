import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';

import '../axios_exception.dart';

/// 错误处理拦截器
class ErrorInterceptor extends Interceptor {
  // 是否有网
  Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    // dio默认的错误实例，如果是没有网络，只能得到一个未知错误，无法精准的得知是否是无网络的情况
    if (err.type == DioErrorType.other) {
      bool isConnectNetWork = await isConnected();
      if (!isConnectNetWork) {
        err.error.message = "当前网络不可用，请检查您的网络";
      }
    }
    // error统一处理
    Exception appException = AxiosException.create(err);
    // 错误提示
    err.error = appException;
    return super.onError(err, handler);
  }
}