import 'package:flutter/material.dart';

class DataForSign {
  DataForSign(this.title, this.disclaimer, this.textFields, this.question,
      this.linkText, this.linkScreen, this.textButton);
  String title;
  String disclaimer;
  List<Widget> textFields;
  String question;
  String linkText;
  Widget linkScreen;
  String textButton;
}
