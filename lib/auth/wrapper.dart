import 'package:experiment/services/auth_service.dart';
import 'package:experiment/auth/login/login_screen.dart';
import 'package:experiment/auth/verify.dart';
import 'package:experiment/home/home.dart';
import 'package:experiment/model/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
            // return  VerifyScreen();
            return user == null ? loginScreen : checkIfVerified();
          }else{
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
        });
  }

  Widget loginScreen = LoginScreen();

  Widget checkIfVerified(){
    final auth = FirebaseAuth.instance;
    var user = auth.currentUser;
    var widget;

    if (!user!.emailVerified) {
      widget = VerifyScreen();
    }else{
      widget = Home();
    }

    return widget;
  }
}
