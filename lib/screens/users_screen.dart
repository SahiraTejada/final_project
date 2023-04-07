import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  Future<UsersModel> getUsers() async {
    final response = await http.get(
      Uri.parse('https://dummyjson.com/users'),
    );

    if (response.statusCode == 200) {
      return UsersModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.body);
    }
  }

  void attemptGetUsers() {
    getUsers()
        .then(
          (users) => print(users.users),
        )
        .catchError(
          (error) => print(error),
        );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUsers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data!.users.length,
            itemBuilder: (context, index) {
              return Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage:
                        NetworkImage(snapshot.data!.users[index]['image']),
                    backgroundColor: Colors.white,
                  ),
                  Column(
                    children: <Widget>[
                      Text(snapshot.data!.users[index]['username']),
                      Text(snapshot.data!.users[index]['email']),
                    ],
                  )
                ],
              );
            },
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
