import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:metu_app/router/index.dart';
import 'package:metu_app/utils/logger/index.dart';
import 'package:metu_app/utils/request/axios_entity.dart';
import 'package:metu_app/utils/storage/index.dart';
import 'package:metu_app/views/home/index.dart';

void main() async {

  Console().init();

  const env = String.fromEnvironment('env');
  Console.log(env);
  if (env != 'dev' && env != 'prod') {
    // 如果不传dev或者prod默认使用dev环境
    await dotenv.load(fileName: ".dev.env");
  } else {
    await dotenv.load(fileName: ".$env.env");
  }

  Console.log(dotenv.get('baseUrl'));
  AxiosEntity().init(baseUrl: dotenv.get('baseUrl'));

  WidgetsFlutterBinding.ensureInitialized();

  await LocalStorage.init();

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
      initialRoute: 'home',
      onGenerateRoute: routeHook,
      home: const HomePage(),
    );
  }
}
