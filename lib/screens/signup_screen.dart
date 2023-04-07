import 'package:final_project/screens/login_screen.dart';
import 'package:final_project/utils/colors.dart';
import 'package:final_project/utils/text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
                  Image.asset(
                    'assets/images/shopintec-logo.png',
                    width: 170,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Wrap(
                      spacing: double.infinity,
                      runSpacing: 5,
                      children: <Widget>[
                        Text('Sign Up', style: titleStyle),
                        Text('Let\'s get started', style: disclaimerStyle),
                      ],
                    ),
                  ),
                  Wrap(
                    runSpacing: 37,
                    children: <Widget>[
                      const TextField(
                        decoration: InputDecoration(hintText: 'Username'),
                        keyboardType: TextInputType.name,
                      ),
                      const TextField(
                        decoration: InputDecoration(hintText: 'Email'),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const TextField(
                        decoration: InputDecoration(hintText: 'Password'),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(0),
                          ),
                          onPressed: () {},
                          child: Text('Sign Up', style: buttonTextStyle)),
                    ],
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Already have an account? ',
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
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                          text: 'Login',
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
