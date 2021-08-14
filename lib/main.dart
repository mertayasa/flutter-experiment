import 'package:experiment/auth/auth.dart';
import 'package:experiment/auth/auth_function.dart';
import 'package:experiment/auth/login/login_screen.dart';
import 'package:experiment/auth/register/register_screen.dart';
import 'package:experiment/auth/wrapper.dart';
import 'package:experiment/home/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider<AuthService>(
    //     create: (context) => AuthService(),
    //     child: Consumer<AuthService>(
    //         builder: (contex, authService, _) => MaterialApp(
    //       theme: ThemeData(textTheme: GoogleFonts.nunitoTextTheme(
    //         Theme.of(context).textTheme
    //       )),
    //       home: authService.is Auth,
    //     )));
    return MultiProvider(
        providers: [
          ListenableProvider<AuthService>(
            create: (_) => AuthService(),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(textTheme: GoogleFonts.nunitoTextTheme(
            Theme.of(context).textTheme
          )),
          initialRoute: '/',
          routes: {
            '/': (context) => Wrapper(),
            '/login': (context) => LoginScreen(), 
            '/register': (context) => RegisterScreen()
          },
          // home: LoginScreen()
        ));
  }
}
