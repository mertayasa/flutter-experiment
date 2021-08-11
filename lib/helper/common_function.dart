import 'package:flutter/material.dart';

snackBar(String text, BuildContext context){
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
    ));
}

launchScreen(BuildContext context, screen){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}