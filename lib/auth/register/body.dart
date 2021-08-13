import 'package:experiment/auth/auth.dart';
import 'package:experiment/auth/auth_function.dart';
import 'package:experiment/helper/colors.dart';
import 'package:experiment/helper/common_function.dart';
import 'package:experiment/home/home.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyRegister extends StatefulWidget {
  final Size size;
  const BodyRegister({required this.size});

  @override
  _BodyRegisterState createState() => _BodyRegisterState();
}

class _BodyRegisterState extends State<BodyRegister> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordConfirmController = TextEditingController();

  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Container(
      width: widget.size.width,
      height: widget.size.height,
      padding: EdgeInsets.only(top: widget.size.height * 0.20, left: 20, right: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(
          child: Image.asset('Images/44.jpg', width: widget.size.width * 0.33),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Text('Create account',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ),
        Center(
          child: Text('Register to get started',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
        ),
        SizedBox(
          height: 30,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
                color: colorGrey,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: TextField(
              controller: emailController,
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: 'Email'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
                color: colorGrey,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Password'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
                color: colorGrey,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: TextField(
              obscureText: true,
              controller: passwordConfirmController,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Konfirmasi Password'),
            ),
          ),
        ]),
        SizedBox(
          height: 50,
        ),
        TextButton(
          style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(colorMainGreen),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ))),
          onPressed: () async {
            await authService.registerWithUserAndPassword(emailController.text, passwordController.text, context);
            // if(registerUser == null){
            //   snackBar('Fucking Failed', context);
            // }else{
            //   launchScreen(context, Home());
            // }
          },
          child: Center(
              child: Text('Daftar',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20))),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sudah Punya Akun?',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
            ),
            GestureDetector(
              onTap: () {
                launchScreen(context, Auth());
              },
              child: Text(
                ' Login',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: colorMainGreen,
                    fontSize: 15),
              ),
            )
          ],
        ))
      ]),
    );
  }
}
