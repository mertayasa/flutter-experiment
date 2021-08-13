import 'package:experiment/app_color.dart';
import 'package:experiment/auth/auth.dart';
import 'package:experiment/auth/auth_function.dart';
import 'package:experiment/auth/wrapper.dart';
import 'package:experiment/fetch_user.dart';
import 'package:experiment/red_image.dart';
import 'package:experiment/waifu_pics.dart';
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
    return MultiProvider(
        providers: [
          Provider<AuthService>(
            create: (_) => AuthService(),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(textTheme: GoogleFonts.nunitoTextTheme(
            Theme.of(context).textTheme
          )),
          home: Wrapper(),
        ));
  }
}
