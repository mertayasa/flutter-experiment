import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class AppColor with ChangeNotifier {
    bool _isLightBlue = true;

    bool get isLightBlue => _isLightBlue;
    
    set isLightBLue(bool value){
      _isLightBlue = value;
      notifyListeners();
    }

    Color get appColor => (_isLightBlue) ? Colors.blue : Colors.red;
}