import 'package:flutter/material.dart';
import 'package:metu_app/views/login/login.dart';
import 'package:dio/dio.dart';
Dio dio =  Dio();

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String username = '';
  String password = '';
  String email = '';
  String phone = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [0.0, 0.5, 1.0],
            colors: [
              Color.fromRGBO(192, 132, 252, 1),
              Color.fromRGBO(236, 72, 153, 1),
              Color.fromRGBO(239, 68, 68, 1)
            ],
          ),
        ),
        child: Center(
          child: Stack(
              children: [
          Container(
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
            const Text(
            '账号注册',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36.0,
                height: 1.2,
                fontFamily: "Courier",
                decoration: TextDecoration.none,
              ),
            ),
            TextFormField(
              onChanged: (value) {
                username = value;
                debugPrint('用户名$username');
              },
              decoration: const InputDecoration(
                labelText: "账号",
                hintText: '请输入账号',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              onChanged: (value) {
                password = value;
              },
              decoration: const InputDecoration(
                labelText: "密码",
                hintText: '请输入密码',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              onChanged: (value) {
                email = value;
              },
              decoration: const InputDecoration(
                labelText: "邮箱",
                hintText: '请输入邮箱',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              onChanged: (value) {
                phone = value;
              },
              decoration: const InputDecoration(
                labelText: "电话",
                hintText: '请输入电话',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: SizedBox(
                width: 200.0,
                height: 50.0,

                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(PageRouteBuilder(
                        transitionDuration: const Duration(
                            milliseconds: 250), // //动画时间为0.25秒
                        pageBuilder: (BuildContext context,
                            Animation animation,
                            Animation secondaryAnimation) {
                          return const LoginPage();
                        }));
                  },
                  child: const Text('已有账号，马上登录'),
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: SizedBox(
                width: 200.0,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () async {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    if (_formKey.currentState!.validate()) {
                      // Process data.
                      var formData = FormData.fromMap({"username": username, "password": password, "email": email, "phone": phone});
                      debugPrint('${username}');
                      var response = await dio.post("http://81.71.85.68:7000/backend/user/register",data: formData);
                      debugPrint('$response');
                    }
                  },
                  child: const Text('注册'),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    ],
    ),
    ),
    ),
    );
  }
}
