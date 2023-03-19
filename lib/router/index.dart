import 'package:flutter/material.dart';
import 'package:metu_app/utils/logger/index.dart';
import 'package:metu_app/utils/storage/index.dart';
import 'package:metu_app/views/home/index.dart';
import 'package:metu_app/views/login/login.dart';

/// 路由表
Map<String, WidgetBuilder> router = {
  'home': (buildContext) => const HomePage(),
  'login': (buildContext) => const LoginPage()
};

//固定写法
var routeHook = (RouteSettings settings) {
  Console.log('路由守卫');
  // 统一处理
  final name = settings.name;
  WidgetBuilder pageContentBuilder = router[name] ?? (content) => const HomePage();
  // 没有登陆信息就前往登陆页
  if (!LocalStorage.containsKey('userInfo')) pageContentBuilder = (content) => const LoginPage();
  final Route route = MaterialPageRoute(builder: (context) => pageContentBuilder(context));
  return route;
};