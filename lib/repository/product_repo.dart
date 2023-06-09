import 'dart:convert';
import 'dart:developer';
import 'package:dash/utils/imports.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  static Future<(String status, List<StoreProductModel>? storeProductModel)>
      fetchAllProduct() async {
    var client = http.Client();
    try {
      if (await Helper.checkInternet()) {
        var response = await client.get(
          Uri.parse(ApiURL.productsURL),
        );
        log(response.statusCode.toString());
        log(response.body);
        List<StoreProductModel> dataList = [];

        List resList = jsonDecode(response.body);
        for (int i = 0; i < resList.length; i++) {
          StoreProductModel post =
              StoreProductModel.fromJson(resList[i] as Map<String, dynamic>);
          dataList.add(post);
        }
        return (response.statusCode.toString(), dataList);
      } else {
        return ("No Internet", null);
      }
    } catch (e) {
      log(e.toString());
      return ("0", null);
    }
  }

  static Future<(String status, UserModel? userModel)> createAccount(
      UserModel user) async {
    var client = http.Client();
    try {
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
    } catch (e) {
      log(e.toString());
      return ("0", null);
    }
  }
}
