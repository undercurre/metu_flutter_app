import 'package:dio/dio.dart';

import 'interceptor/error_interceptor.dart';

/// 单例
class DioEntity {
  ///超时时间
  static const int CONNECT_TIMEOUT = 30000;
  static const int RECEIVE_TIMEOUT = 30000;

  static final DioEntity _instance = DioEntity._internal();

  factory DioEntity() => _instance;

  Dio dio;
  final CancelToken _cancelToken = CancelToken();

  DioEntity._internal() {
    // BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
    BaseOptions options = BaseOptions(
      connectTimeout: CONNECT_TIMEOUT,

      // 响应流上前后两次接受到数据的间隔，单位为毫秒。
      receiveTimeout: RECEIVE_TIMEOUT,

      // Http请求头.
      headers: {},
    );

    dio = Dio(options);

    // 添加error拦截器
    dio.interceptors.add(ErrorInterceptor());
  }

  ///初始化公共属性
  ///
  /// [baseUrl] 地址前缀
  /// [connectTimeout] 连接超时赶时间
  /// [receiveTimeout] 接收超时赶时间
  /// [interceptors] 基础拦截器
  void init(
      {required String baseUrl,
      required int connectTimeout,
      required int receiveTimeout,
      required List<Interceptor> interceptors}) {
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = connectTimeout;
    dio.options.receiveTimeout = receiveTimeout;
    if (interceptors.isNotEmpty) {
      dio.interceptors.addAll(interceptors);
    }
  }
}
