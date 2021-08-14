import 'package:experiment/helper/common_function.dart';
import 'package:experiment/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthService with ChangeNotifier {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  UserModel? _userFromFirebase(auth.User? user){
    if(user == null){
      return null;
    }

    return UserModel(user.uid, user.email);
  }

  Stream<UserModel?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future loginWithUserAndPassword(
    String email,
    String password,
    BuildContext context
  ) async {

    try{
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, 
        password: password
      );
      return _userFromFirebase(credential.user);
    }catch(error){
      snackBar('Unable to sign in (Invalid email or password)', context);
      return _userFromFirebase(null);
    }

  }

  Future<UserModel?> registerWithUserAndPassword(
    String email,
    String password,
    BuildContext context
  ) async {
    try{
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );

      return _userFromFirebase(credential.user);
    }catch(error){
      snackBar('Unable to register (Invalid email or password)', context);
      return _userFromFirebase(null);
    }
  }

  Future<void> logOut() async {
    return await _firebaseAuth.signOut();
  }

  Future<auth.UserCredential> signInWithGoogle() async {
      // Trigger the authentication flow
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential
      final credential = auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      return await auth.FirebaseAuth.instance.signInWithCredential(credential);
  }

  // Future<auth.UserCredential> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();

  //   // Create a credential from the access token
  //   final auth.OAuthCredential facebookAuthCredential = auth.FacebookAuthProvider.credential(loginResult.accessToken!.token);

  //   // Once signed in, return the UserCredential
  //   return auth.FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }
}


void proccedRegister(BuildContext context, email, password, passwordConfirm) {
  snackBar(email + password + passwordConfirm, context);
}

void proccedLogin(BuildContext context, email, password) {
  snackBar(email + password, context);
}

  // set setAuth(bool value){
  //   isUserAuth = value;
  //   notifyListeners();
  // }

  // get isAuth => (isUserAuth == false) ? Auth(check: 'register') : Home();
