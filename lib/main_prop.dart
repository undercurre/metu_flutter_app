import 'package:flutter/material.dart';
import 'package:metu_app/router/index.dart';
import 'package:metu_app/utils/request/axios_entity.dart';
import 'package:metu_app/views/home/index.dart';

import 'config/index.dart';

void main() {
  AppConfig().init(
      flavor: BuildFlavor.prop,
      baseUrl: 'http://localhost:7000/',
      name: 'Metu');

  AxiosEntity().init(baseUrl: AppConfig.apiBaseUrl);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      routes: router,
      home: const HomePage(),
    );
  }
}