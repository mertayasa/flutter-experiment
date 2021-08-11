import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

const textColorGrey = Color(0xFF4E4E4E);
const colorGrey = Color(0xFFEEEEEE);

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.black87,
  primary: Colors.grey[300],
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);