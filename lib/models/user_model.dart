class UsersModel {
  UsersModel({
    required this.users,
    required this.total,
    required this.skip,
    required this.limit,
  });

  final List<dynamic> users;
  final int total;
  final int skip;
  final int limit;

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      users: json['users'],
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }
}

class UserModel {
  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.image,
    this.token,
  });

  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String image;
  final String? token;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      gender: json['gender'],
      image: json['image'],
      token: json['token'],
    );
  }
}
