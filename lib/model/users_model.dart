import 'dart:convert';

List<UsersModel> userModelFromJson(String str) =>
    List<UsersModel>.from(json.decode(str).map((x) => UsersModel.fromJson(x)));

String userModelToJson(List<UsersModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UsersModel {
  UsersModel({
    this.login,
    this.id,
    this.avatarUrl,
    this.type,
    this.url,
    this.following,
  });

  String login;
  int id;
  String url;
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

  UsersModel.fromJson(Map<String, dynamic> jsonData) {
    login = jsonData["login"];
    id = jsonData["id"];
    avatarUrl = jsonData["avatar_url"];
    url = jsonData["url"];
    following = jsonData["following"];
  }
  Map<String, dynamic> toJson() => {
        "login": login,
        "id": id,
        "avatar_url": avatarUrl,
        "url": url,
        "following": following,
      };
}
