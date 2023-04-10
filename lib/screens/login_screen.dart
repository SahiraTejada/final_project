import 'dart:convert';

import 'package:final_project/screens/shared_layout.dart';
import 'package:final_project/utils/colors.dart';
import 'package:final_project/utils/text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<UserModel> login() async {
    final response = await http.post(
      Uri.parse('https://dummyjson.com/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': usernameController.text,
        'password': passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.body);
    }
  }

  void attemptLogin(BuildContext context) {
    login()
        .then(
          (user) => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SharedLayout(loggedInUser: user),
            ),
          ),
        )
        .catchError(
          (error) => Fluttertoast.showToast(
            msg: 'Incorrect username or password',
            toastLength: Toast.LENGTH_LONG,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 30,
                left: 35,
                right: 35,
                bottom: MediaQuery.of(context).padding.bottom + 30,
              ),
              child: Wrap(
                runSpacing: 40,
                alignment: WrapAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/images/shopintec-logo.svg',
                    width: MediaQuery.of(context).size.width / 2,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Wrap(
                      spacing: double.infinity,
                      runSpacing: 5,
                      children: <Widget>[
                        Text('Login Account', style: titleStyle),
                        Text('Welcome back, please enter your details',
                            style: disclaimerStyle),
                      ],
                    ),
                  ),
                  Wrap(
                    runSpacing: 37,
                    children: <Widget>[
                      TextField(
                        decoration: const InputDecoration(hintText: 'Username'),
                        keyboardType: TextInputType.name,
                        controller: usernameController,
                      ),
                      TextField(
                        decoration: const InputDecoration(hintText: 'Password'),
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        controller: passwordController,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                          ),
                          onPressed: () {
                            attemptLogin(context);
                          },
                          child: Text('Login', style: buttonTextStyle)),
                    ],
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Don\'t have an account? ',
                      style: disclaimerStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignupScreen(),
                                ),
                              );
                            },
                          text: 'Sign Up',
                          style: const TextStyle(
                            color: orange,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
