// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'package:dash/utils/imports.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDatabase {
  static Future<bool> saveCurrentUser(UserModel userModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    try {
      return await sharedPreferences.setString(
          AppString.currentUserPref, jsonEncode(userModel));
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<UserModel?> getCurrentUser() async {
    UserModel? userModel;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? data = sharedPreferences.getString(AppString.currentUserPref);

    if (data != null) {
      try {
        userModel = UserModel.fromJson(jsonDecode(data));
        log(userModel.toJson().toString());

        return userModel;
      } catch (e) {
        log(e.toString());
      }
    }
    return userModel;
  }

  static void clear() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(AppString.currentUserPref);
  }

  static void clearDb() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}
