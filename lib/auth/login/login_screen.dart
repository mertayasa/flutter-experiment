import 'package:experiment/auth/auth.dart';
import 'package:experiment/auth/auth_function.dart';
import 'package:experiment/auth/register/register_screen.dart';
import 'package:experiment/helper/colors.dart';
import 'package:experiment/helper/common_function.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen();

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: 
        Container(
      // width: size.width,
      // height: size.height,
      padding:
          EdgeInsets.only(top: size.height * 0.10, left: size.width * 0.1, right: size.width * 0.1),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(
          child: Image.asset('Images/44.jpg', width: size.width * 0.33),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Text('Login to continue',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 20,
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
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Password'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Forgot Password ?',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
          )
        ]),
        SizedBox(
          height: 30,
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
            await authService.loginWithUserAndPassword(
                emailController.text, passwordController.text, context);
                FocusScope.of(context).unfocus();
            Navigator.of(context).popUntil(ModalRoute.withName('/'));
          },
          child: Center(
              child: Text('Login',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
        ),
        SizedBox(
          height: 30,
        ),
        Center(
          child: Text(
            'Or connect using',
            style: TextStyle(color: textColorGrey.withOpacity(0.5), fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    backgroundColor: Colors.grey[200],
                    side: BorderSide(color: colorGrey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                onPressed: () async {
                  await authService.signInWithGoogle();
                  FocusScope.of(context).unfocus();
                  Navigator.of(context).popUntil(ModalRoute.withName('/'));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Image.asset("Images/google_icon.png", width: 20),
                    ),
                    Text('Google',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black))
                  ],
                ), // borderSide: BorderSide(color: Colors.blue),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    backgroundColor: facebookBlue,
                    side: BorderSide(color: facebookBlue),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                onPressed: () async {
                  snackBar('Sorry, facebook auth currently unavailable', context);
                  // await authService.signInWithFacebook();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Image.asset("Images/facebook_logo.png", width: 10),
                    ),
                    Text('facebook',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.white))
                  ],
                ), // borderSide: BorderSide(color: Colors.blue),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Belum Punya Akun?',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/register');
                // launchScreen(context, RegisterScreen(size: size));
              },
              child: Text(
                ' Daftar',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: colorMainGreen,
                    fontSize: 15),
              ),
            )
          ],
        )),
      ]),
    ))
    );
  }
}
