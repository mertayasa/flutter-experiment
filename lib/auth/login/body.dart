import 'package:experiment/auth/auth.dart';
import 'package:experiment/auth/auth_function.dart';
import 'package:experiment/helper/colors.dart';
import 'package:experiment/helper/common_function.dart';
import 'package:experiment/home/home.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyLogin extends StatefulWidget {
  final Size size;
  const BodyLogin({required this.size});

  @override
  _BodyLoginState createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {
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

    return Container(
      width: widget.size.width,
      height: widget.size.height,
      padding:
          EdgeInsets.only(top: widget.size.height  * 0.10, left: 20, right: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(
          child: Image.asset('Images/44.jpg', width: widget.size.width * 0.33),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Text('Welcome',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ),
        Center(
          child: Text('Login to continue',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
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
            var logInUser = await authService.loginWithUserAndPassword(
                emailController.text, passwordController.text);
            if (logInUser == null) {
              snackBar('Account Not Found', context);
            } else {
              launchScreen(context, Home());
            }
          },
          child: Center(
              child: Text('Login',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16))),
        ),

        SizedBox(
          height: 20,
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
                launchScreen(context, Auth(check: 'register'));
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
        
        SizedBox(
          height: 20,
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              backgroundColor: Colors.grey[200],
              side: BorderSide(color: colorGrey),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              )),
          onPressed: () async {
            var logInUser = await authService.signInWithGoogle();
            // var logInUser = await authService.loginWithUserAndPassword(emailController.text, passwordController.text);
            // if(logInUser == null){
            //   snackBar('Account Not Found', context);
            // }else{
            //   launchScreen(context, Home());
            // }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Image.asset("Images/google_icon.png", width: 20),
              ),
              Text('Continue with google',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black))
            ],
          ),// borderSide: BorderSide(color: Colors.blue),
        ),
        SizedBox(
          height: 20,
        ),
        
      ]),
    );
  }
}
