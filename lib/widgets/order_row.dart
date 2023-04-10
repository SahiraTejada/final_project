import 'package:flutter/material.dart';

import 'order_single_data.dart';

class OrderRow extends StatelessWidget {
  const OrderRow(
      {super.key,
      required this.label1,
      required this.label2,
      required this.data1,
      required this.data2});
  final String label1;
  final String label2;
  final String data1;
  final String data2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        OrderSingleData(label: label1, data: data1),
        OrderSingleData(label: label2, data: data2),
      ],
    );
  }
}
