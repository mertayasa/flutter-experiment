import 'package:experiment/auth/auth.dart';
import 'package:experiment/auth/auth_function.dart';
import 'package:experiment/home/home.dart';
import 'package:experiment/model/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return StreamBuilder<User?>(
        stream: authService.user,
        builder: (_, AsyncSnapshot<User?> snapshot) {
          if(snapshot.connectionState == ConnectionState.active){
            final User? user = snapshot.data;
            return user == null ? Auth() : Home();
          }else{
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
        });
  }
}
