import 'dart:convert';
/*
Working with a raw Future<http.Response> isn’t very convenient. To make your life easier, convert the http.Response into a Dart object.
*/
//Convert between JSON strings and a list of UserModel objects.

/*List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
    */

class UserModel {
  

}