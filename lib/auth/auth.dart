import 'package:experiment/auth/login/background.dart';
import 'package:experiment/auth/login/body.dart';
import 'package:experiment/auth/register/body.dart';
import 'package:experiment/helper/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class Auth extends StatelessWidget {
  // const Login({Key? key}) : super(key: key);
  final String? check;
  const Auth({this.check});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    return SafeArea(
      child: SingleChildScrollView(
        child: check == null ? BodyLogin(size: size) : BodyRegister(size: size)
      ),
    );
  }
}
