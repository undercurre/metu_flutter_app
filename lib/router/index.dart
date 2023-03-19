import 'package:flutter/cupertino.dart';
import 'package:metu_app/views/home/index.dart';
import 'package:metu_app/views/login/login.dart';

/// 路由表
Map<String, WidgetBuilder> router = {
  'home': (buildContext) => const HomePage(),
  'login': (buildContext) => const LoginPage()
};