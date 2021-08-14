import 'package:experiment/auth/login/background.dart';
import 'package:experiment/auth/login/login_screen.dart';
import 'package:experiment/auth/register/register_screen.dart';
import 'package:experiment/helper/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Auth extends StatelessWidget {
  // const Login({Key? key}) : super(key: key);
  final String? check;
  const Auth({this.check});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
          // child: BodyRegister(size: size)
            child: check == null ? LoginScreen() : RegisterScreen()
          ),
    ));
  }
}
