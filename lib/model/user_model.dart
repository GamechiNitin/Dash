class UserResponse {
  List<UserModel>? results;

  UserResponse({this.results});

  UserResponse.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <UserModel>[];
      json['results'].forEach((v) {
        results!.add(UserModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserModel {
  String? username;
  String? email;
  String? password;
  String? token;
  int? id;

  UserModel({
    this.username,
    this.email,
    this.password,
    this.token,
    this.id,
  });

  UserModel.fromJson(Map<dynamic, dynamic> json) {
    username = json['username'];
    email = json['email'].toString().toLowerCase();
    password = json['password'];
    token = json['token'];
    id = json['id'];
  }

  Map<dynamic, dynamic> toJson() {
    Map<dynamic, dynamic> data = <String, dynamic>{};
    data["username"] = username;
    data["email"] = email.toString().toLowerCase();
    data["password"] = password;
    data["id"] = id;
    data["token"] = token;
    return data;
  }
}
