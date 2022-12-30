import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
              width: 200,
              height: 200,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
