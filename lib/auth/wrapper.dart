import 'package:experiment/auth/auth.dart';
import 'package:experiment/auth/auth_function.dart';
import 'package:experiment/auth/login/login_screen.dart';
import 'package:experiment/home/home.dart';
import 'package:experiment/model/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    
    return StreamBuilder<UserModel?>(
        stream: authService.user,
        builder: (_, AsyncSnapshot<UserModel?> snapshot) {
          if(snapshot.connectionState == ConnectionState.active){
            final UserModel? user = snapshot.data;
            return user == null ? loginScreen : Home();
          }else{
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
        });
  }

  Widget loginScreen = LoginScreen();
}
