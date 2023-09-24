import 'dart:developer';

import 'package:dash/utils/imports.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  static Future<(String status, UserCredential? userCredential)> logIn(
      UserModel user) async {
    try {
      if (await Helper.checkInternet()) {
        var response = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: user.email!,
          password: user.password!,
        );

        return ('200', response);
      } else {
        return ("No Internet", null);
      }
    } on FirebaseAuthException catch (e) {
      log("Err ${e.code}");
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        log("Err ${e.code}");
        return ('Invalid Login credential', null);
      } else {
        return ('Something went wrong', null);
      }
    } catch (e) {
      log(e.toString());
      return (e.toString(), null);
    }
  }

  static Future<(String status, UserCredential? userCredential)> createAccount(
      UserModel user) async {
    try {
      if (await Helper.checkInternet()) {
        var response =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: user.email!,
          password: user.password!,
        );

        return ('200', response);
      } else {
        return ("No Internet", null);
      }
    } on FirebaseAuthException catch (e) {
      log("Err ${e.code}");
      if (e.code == 'weak-password') {
        return ('The password provided is too weak.', null);
      } else if (e.code == 'email-already-in-use') {
        return ('The account already exists for that email.', null);
      } else {
        return ('Something went wrong', null);
      }
    } catch (e) {
      log(e.toString());
      return (e.toString(), null);
    }
  }
}
