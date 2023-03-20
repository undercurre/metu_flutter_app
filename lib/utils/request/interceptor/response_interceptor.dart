import 'package:dio/dio.dart';


/// 响应处理拦截器
class ResponseInterceptor extends Interceptor {

  @override
  Future<void> onResponse(Response response,
      ResponseInterceptorHandler handler) async {
    return super.onResponse(response, handler);
  }

  /// 处理响应
  Response<dynamic> responseHandler(Response response) {
    if (response.statusCode == 200) {
      return response;
    } else {
      response.statusMessage = handleBadStatus(response.statusCode);
      return response;
    }
  }

  String handleBadStatus(int? statusCode) {
    var errMessage = '未知错误';
    if (statusCode != null) {
      switch (statusCode) {
        case 400:
          errMessage = '错误的请求';
          break;
        case 401:
          errMessage = '未授权，请重新登录';
          break;
        case 403:
          errMessage = '拒绝访问';
          break;
        case 404:
          errMessage = '请求错误,未找到该资源';
          break;
        case 405:
          errMessage = '请求方法未允许';
          break;
        case 408:
          errMessage = '请求超时';
          break;
        case 500:
          errMessage = '服务器端出错';
          break;
        case 501:
          errMessage = '网络未实现';
          break;
        case 502:
          errMessage = '网络错误';
          break;
        case 503:
          errMessage = '服务不可用';
          break;
        case 504:
          errMessage = '网络超时';
          break;
        case 505:
          errMessage = 'http版本不支持该请求';
          break;
        default:
          errMessage = '其他连接错误 --$statusCode';
      }
    } else {
      errMessage = '无法连接到服务器！';
    }
    return errMessage;
  }
}