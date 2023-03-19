import 'package:flutter/material.dart';
import 'package:metu_app/views/home/index.dart';
import 'package:metu_app/views/login/login.dart';

/// 路由表
Map<String, WidgetBuilder> router = {
  'home': (buildContext) => const HomePage(),
  'login': (buildContext) => const LoginPage()
};

//固定写法
var onGenerateRoute = (RouteSettings settings) {
  // 统一处理
  final name = settings.name;
  final WidgetBuilder pageContentBuilder = router[name] ?? (content) => const HomePage();
  final Route route = MaterialPageRoute(builder: (context) => pageContentBuilder(context));
  return route;
};