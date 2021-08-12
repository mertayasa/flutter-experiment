import 'package:experiment/helper/common_function.dart';
import 'package:experiment/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  User? _userFromFirebase(auth.User? user){
    if(user == null){
      return null;
    }

    return User(user.uid, user.email);
  }

  Stream<User?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future loginWithUserAndPassword(
    String email,
    String password
  ) async {

    try{
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, 
        password: password
      );
      return _userFromFirebase(credential.user);
    }catch(error){
      return _userFromFirebase(null);
    }

  }

  Future<User?> registerWithUserAndPassword(
    String email,
    String password
  ) async {
    try{
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );

      return _userFromFirebase(credential.user);
    }catch(error){
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

}

void proccedRegister(BuildContext context, email, password, passwordConfirm) {
  snackBar(email + password + passwordConfirm, context);
}

void proccedLogin(BuildContext context, email, password) {
  snackBar(email + password, context);
}
