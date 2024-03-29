import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:metu_app/utils/logger/index.dart';

import 'interceptor/error_interceptor.dart';
import 'interceptor/request_interceptor.dart';
import 'interceptor/response_interceptor.dart';

class AxiosEntity {
  static final AxiosEntity _instance = AxiosEntity._internal();

  // 单例模式使用Http类
  factory AxiosEntity() => _instance;

  static late final Dio dio;

  AxiosEntity._internal() {
    // BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
    BaseOptions options = BaseOptions();

    dio = Dio(options);

    // 添加request拦截器
    dio.interceptors.add(RequestInterceptor());
    // 添加error拦截器
    dio.interceptors.add(ErrorInterceptor());
    // 添加response拦截器
    dio.interceptors.add(ResponseInterceptor());
  }

  ///初始化公共属性
  ///
  /// [baseUrl] 地址前缀
  /// [connectTimeout] 连接超时赶时间
  /// [receiveTimeout] 接收超时赶时间
  /// [interceptors] 基础拦截器
  void init({
    String? baseUrl,
    int connectTimeout = 1500,
    int receiveTimeout = 1500,
    Map<String, String>? headers,
    List<Interceptor>? interceptors,
  }) {
    dio.options = dio.options.copyWith(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      headers: headers ?? const {},
    );
    // 在初始化http类的时候，可以传入拦截器
    if (interceptors != null && interceptors.isNotEmpty) {
      dio.interceptors.addAll(interceptors);
    }
  }

  static Future get(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    Response response;
    response = await dio.get(
      path,
      queryParameters: params,
      options: requestOptions,
    );
    return response.data;
  }

  static Future post(
    String path, {
    Map<String, dynamic>? params,
    data,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    var response = await dio.post(
      path,
      data: data,
      queryParameters: params,
      options: requestOptions,
    );
    return response.data;
  }

  static Future put(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    var response = await dio.put(
      path,
      data: data,
      queryParameters: params,
      options: requestOptions,
    );
    return response.data;
  }

  static Future patch(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    var response = await dio.patch(
      path,
      data: data,
      queryParameters: params,
      options: requestOptions,
    );
    return response.data;
  }

  static Future delete(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    var response = await dio.delete(
      path,
      data: data,
      queryParameters: params,
      options: requestOptions,
    );
    return response.data;
  }
}
