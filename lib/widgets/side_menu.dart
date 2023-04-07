import 'package:final_project/models/user_model.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/text_styles.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key, required this.loggedInUser});

  final UserModel loggedInUser;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 65,
              backgroundColor: lightGray,
              backgroundImage: NetworkImage(loggedInUser.image),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 45, bottom: 25),
              child: Text('${loggedInUser.firstName} ${loggedInUser.lastName}',
                  style: nameStyle),
            ),
            Text(loggedInUser.email, style: emailStyle),
          ],
        ),
      ),
    );
  }
}
