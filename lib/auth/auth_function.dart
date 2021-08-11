import 'package:experiment/helper/common_function.dart';
import 'package:flutter/widgets.dart';


void proccedRegister(BuildContext context, email, password, passwordConfirm) {
  snackBar(email + password + passwordConfirm, context);
}

void proccedLogin(BuildContext context, email, password) {
  snackBar(email + password, context);
}
