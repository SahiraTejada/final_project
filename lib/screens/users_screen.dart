import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:final_project/utils/colors.dart';
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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final random = Random();

    return FutureBuilder(
      future: getUsers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          print(snapshot);
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data!.users.length,
            itemBuilder: (context, index) {
              return Container(
                height: height / 9,
                width: width / 6,
                margin: EdgeInsets.symmetric(
                  horizontal: width * 0.05, 
                  vertical: height * 0.02),
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(22),
                  ),
                  color: Colors.white,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                            color: 
                              Colors.primaries[random.nextInt(Colors.primaries.length)]
                                [random.nextInt(9) * 100],
                            border: Border.all(
                              width: 0.3,
                              color: titleColor.withOpacity(0.4)
                            ),
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                snapshot.data!.users[index].image
                              )
                            )
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 8),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(snapshot.data!.users[index].username,
                          style: const TextStyle(
                            color: Color.fromRGBO(26, 32, 44, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                          )
                        ),
                        const SizedBox(height: 6),
                        Text(
                          snapshot.data!.users[index].email,
                          style: const TextStyle(
                            color: Color.fromRGBO(26, 32, 44, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
