import 'package:flutter/material.dart';
import 'package:metu_app/views/login/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            '账密登录',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36.0,
                              height: 1.2,
                              fontFamily: "Courier",
                              decoration: TextDecoration.none,
                            ),
                          ),
                          TextFormField(
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
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              GestureDetector(
                                onTap: () => goToRegister(),
                                child: const Text(
                                  '注册账号',
                                  style: TextStyle(color: Colors.white),
                                ),),
                                const Text(
                                  '忘记密码？',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: SizedBox(
                              width: 200.0,
                              height: 50.0,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Validate will return true if the form is valid, or false if
                                  // the form is invalid.
                                  if (_formKey.currentState!.validate()) {
                                    // Process data.
                                  }
                                },
                                child: const Text('登录'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  goToRegister() {
    Navigator.of(context).push(
        PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 250), // //动画时间为0.25秒
            pageBuilder: (BuildContext context,Animation animation,
                Animation secondaryAnimation){
              return const RegisterPage();
            }
        )
    );
  }
}