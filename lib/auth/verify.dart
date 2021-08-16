import 'dart:async';

import 'package:experiment/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VerifyScreen extends StatefulWidget {
  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final auth = FirebaseAuth.instance;
  var user;
  var timer;

  @override
  void initState() {
    user = auth.currentUser;
    if (!user.emailVerified) {
      user.sendEmailVerification();
    }

    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          'Images/verify_email.png',
          width: size.width * 0.7,
        ),
        Text('One more step',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.15),
          child: Text('An email has been sent to ${user.email} please verify',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              textAlign: TextAlign.center),
        )
      ])),
    );
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser;
    await user.reload();
    if (user.emailVerified) {
      print('is verified ? ${user.emailVerified}');
      timer.cancel();
      Navigator.pushNamed(context, '/');
    }
  }
}
