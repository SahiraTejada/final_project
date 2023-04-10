import 'package:flutter/material.dart';

import '../utils/text_styles.dart';

class OrderSingleData extends StatelessWidget {
  const OrderSingleData({super.key, required this.label, required this.data});

  final String label;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text('$label ', style: orderOrangeStyle),
        Text(data, style: orderBlackStyle),
      ],
    );
  }
}
