import 'dart:convert';

import 'package:final_project/models/order_model.dart';
import 'package:final_project/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../widgets/order_row.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  Future<OrdersModel> getOrders() async {
    final response = await http.get(
      Uri.parse('https://dummyjson.com/carts'),
    );

    if (response.statusCode == 200) {
      return OrdersModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getOrders(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
            itemCount: snapshot.data!.orders.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  children: <Widget>[
                    OrderRow(
                      label1: 'ID',
                      label2: 'Total',
                      data1: '${snapshot.data!.orders[index].id}',
                      data2: '\$${snapshot.data!.orders[index].totalMoney}',
                    ),
                    const Divider(color: lightGray),
                    OrderRow(
                      label1: 'Products',
                      label2: 'Quantity',
                      data1: '${snapshot.data!.orders[index].totalProducts}',
                      data2: '${snapshot.data!.orders[index].totalQuantity}',
                    ),
                  ],
                ),
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
