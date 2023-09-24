import 'dart:convert';
import 'dart:developer';

import 'package:dash/utils/imports.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

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

  static Future<(String status, UserModel? userModel)> createAccount(
      UserModel user) async {
    var client = http.Client();
    try {
      if (await Helper.checkInternet()) {
        var response = await client.post(Uri.parse(ApiURL.signUp), body: {
          "email": user.email,
          "username": user.username,
          "password": user.password,
        });
        log(response.statusCode.toString());
        log(response.body);
        if (response.statusCode == 200) {
          var res = jsonDecode(response.body);
          UserModel userModel = UserModel(
            email: user.email,
            password: user.password,
            username: user.username,
            id: res["id"],
          );
          return ("200", userModel);
        } else {
          return (response.body, null);
        }
      } else {
        return ("No Internet", null);
      }
    } catch (e) {
      log(e.toString());
      return ("0", null);
    }
  }
}
