import 'package:experiment/auth/login/background.dart';
import 'package:experiment/helper/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  // const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.only(top: 150, bottom: 80, left: 20, right: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Hello\nWelcome Back',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 50,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                    color: colorGrey,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Email'),
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
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ))),
              onPressed: () {},
              child: Center(
                  child: Text('Login',
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 15))),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'Forgot Password ?',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
              ),
            )
          ]),
        ),
      ),
    );

    // return Background(
    //     child: Positioned(
    //   top: size.height * 0.33,
    //   left: 20,
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: <Widget>[
    //       Text(
    //         'Login',
    //         style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900),
    //       ),
    //       Text(
    //         'Please login to continue',
    //         style: TextStyle(fontSize: 20),
    //       ),

    //     ],
    //   ),
    // ));
  }
}
