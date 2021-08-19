import 'package:experiment/services/auth_service.dart';
import 'package:experiment/helper/colors.dart';
import 'package:experiment/helper/common_function.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen();

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
    var size = MediaQuery.of(context).size;
    return Scaffold(
            body: SingleChildScrollView(
                child: Container(
      width: size.width,
      // height: size.height,
      padding: EdgeInsets.only(
          top: size.height * 0.10,
          left: size.width * 0.1,
          right: size.width * 0.1),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(
          child: Image.asset('Images/44.jpg', width: size.width * 0.33),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Text('Register to get started',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
            await authService.registerWithUserAndPassword(
                emailController.text, passwordController.text, context);
            // Navigator.pop(context);
            FocusScope.of(context).unfocus();
            Navigator.of(context).popUntil(ModalRoute.withName('/'));

          },
          child: Center(
              child: Text('Register',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            'Or connect using',
            style: TextStyle(
                color: textColorGrey.withOpacity(0.5),
                fontWeight: FontWeight.bold,
                fontSize: 16),
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
                  Navigator.of(context).popUntil(ModalRoute.withName('/'));
                  // authService.setAuth = true;
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
                  snackBar(
                      'Sorry, facebook auth currently unavailable', context);
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
              'Sudah Punya Akun?',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).popUntil(ModalRoute.withName('/'));
                // Navigator.pushNamed(context, '/login');

                // Navigator.pop(context);
                // launchScreen(context, LoginScreen(size: size));
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
        )),
        SizedBox(
          height: 40,
        ),
      ]),
    )));
  }
}
