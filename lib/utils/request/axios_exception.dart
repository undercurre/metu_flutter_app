/// 自定义异常类型
import 'package:dio/dio.dart';
import 'package:metu_app/utils/logger/index.dart';

class AxiosException implements Exception {
  final String message;
  final int code;

  AxiosException(
    this.code,
    this.message,
  );

  @override
  String toString() {
    return "$code$message";
  }

  factory AxiosException.create(DioError error) {
    Console.log(error);
    switch (error.type) {
      case DioErrorType.cancel:
        {
          return BadRequestException(-1, "请求取消");
        }
      case DioErrorType.connectTimeout:
        {
          return BadRequestException(-1, "连接超时");
        }
      case DioErrorType.sendTimeout:
        {
          return BadRequestException(-1, "请求超时");
        }
      case DioErrorType.receiveTimeout:
        {
          return BadRequestException(-1, "响应超时");
        }
      case DioErrorType.response:
        {
          try {
            int errCode = error.response?.statusCode ?? -1000;
            switch (errCode) {
              case 400:
                {
                  return BadRequestException(errCode!, "请求语法错误");
                }
              case 401:
                {
                  return UnauthorisedException(errCode!, "没有权限");
                }
              case 403:
                {
                  return UnauthorisedException(errCode!, "服务器拒绝执行");
                }
              case 404:
                {
                  return UnauthorisedException(errCode!, "无法连接服务器");
                }
              case 405:
                {
                  return UnauthorisedException(errCode!, "请求方法被禁止");
                }
              case 500:
                {
                  return UnauthorisedException(errCode!, "服务器内部错误");
                }
              case 502:
                {
                  return UnauthorisedException(errCode!, "无效的请求");
                }
              case 503:
                {
                  return UnauthorisedException(errCode!, "服务器挂了");
                }
              case 505:
                {
                  return UnauthorisedException(errCode!, "不支持HTTP协议请求");
                }
              default:
                {
                  return AxiosException(errCode!, error.response?.statusMessage ?? '未知错误');
                }
            }
          } on Exception catch (_) {
            Console.log('报错');
            return AxiosException(-1, "未知错误");
          }
        }
      default:
        {
          return AxiosException(-1, error.message);
        }
    }
  }
}

/// 请求错误
class BadRequestException extends AxiosException {
  BadRequestException(int code, String message) : super(code, message);
}

/// 未认证异常
class UnauthorisedException extends AxiosException {
  UnauthorisedException(int code, String message) : super(code, message);
}