import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

class UpdateUserList extends ChangeNotifier {
  bool _isRefresh = true;

  bool get isListRefresh => _isRefresh;
  
  set isListRefresh(bool value){
    _isRefresh = value;
    notifyListeners();
  }
}