import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    this.login,
    this.id,
    this.avatarUrl,
    this.type,
    this.followers,
    this.following,
  });

  String login;
  int id;
  int followers;
  int following;
  String avatarUrl;
  String type;

  // factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
  //       login: json["login"],
  //       id: json["id"],
  //       avatarUrl: json["avatar_url"],
  //       followers: json["followers"],
  //       following: json["following"]
  //     );

  UserModel.fromJson(Map<String, dynamic> jsonData) {
    login = jsonData["login"];
    id = jsonData["id"];
    avatarUrl = jsonData["avatar_url"];
    followers = jsonData["followers"];
    following = jsonData["following"];
  }
  Map<String, dynamic> toJson() => {
        "login": login,
        "id": id,
        "avatar_url": avatarUrl,
        "followers": followers,
        "following": following,
      };
}
