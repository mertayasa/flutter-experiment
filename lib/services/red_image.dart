import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

class RedImage extends ChangeNotifier {
  bool _isVisible = true;

  bool get isImageVisible => _isVisible;
  
  set isImageVisible(bool value){
    _isVisible = value;
    notifyListeners();
  }
}