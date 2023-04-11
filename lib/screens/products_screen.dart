import 'dart:ffi';

import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<Products> _products = [
    Products(
        "Headphones",
        "Electronics",
        "5000",
        "https://www.energysistem.com/cdnassets/products/45303/front_2000.jpg",
        "18%"),
    Products(
        "Headphones",
        "Electronics",
        "5000",
        "https://www.energysistem.com/cdnassets/products/45303/front_2000.jpg",
        "18%"),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(children: [
          Icon(Icons.sort),
          Padding(padding: EdgeInsets.all(75)),
          Text('Products')
        ]),
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: _products.length,
          itemBuilder: (context, index) {
            return Container(
              height: height / 9,
              width: width / 6,
              margin: EdgeInsets.symmetric(
                  horizontal: width * 0.05, vertical: height * 0.02),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                          color: Colors.white,
                          border: Border.all(
                            width: 0.3,
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    _products[index].productImage))),
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(_products[index].productName,
                          style: const TextStyle(
                              color: Color.fromRGBO(26, 32, 44, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(height: 6),
                      Text(
                        _products[index].productType,
                        style: const TextStyle(
                            color: Color.fromRGBO(26, 32, 44, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(width: 100),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text("\$" + _products[index].productPrice,
                          style: const TextStyle(
                              color: Color.fromRGBO(26, 32, 44, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(height: 6),
                      Text(
                        _products[index].productPercentaje,
                        style: const TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  )
                ],
              ),
            );
            ;
          }),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.orange),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Users"),
        BottomNavigationBarItem(icon: Icon(Icons.backpack), label: "Products"),
        BottomNavigationBarItem(
            icon: Icon(Icons.edit_calendar_sharp), label: "Overview"),
      ]),
    ));
  }
}

class Products {
  String productName = '';
  String productType = '';
  String productPrice = '';
  String productImage = '';
  String productPercentaje = '';

  Products(
      productName, productType, productPrice, productImage, productPercentaje) {
    this.productName = productName;
    this.productType = productType;
    this.productPrice = productPrice;
    this.productImage = productImage;
    this.productPercentaje = productPercentaje;
  }
}

// ListView.builder(
//                 itemCount: _products.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     tileColor: Colors.white,
//                     title: Text(_products[index].productName),
//                     subtitle: Text(_products[index].productType),
//                     leading: CircleAvatar(
//                       child: Image.network(
//                         _products[index].productImage,
//                       ),
//                     ),
//                   );
//                 })

// ListTile(
//               contentPadding: EdgeInsets.all(20),
//               title: Text(_products[index].productName),
//               subtitle: Text(_products[index].productType),
//               leading: CircleAvatar(
//                 child: Image.network(
//                   _products[index].productImage,
//                 ),
//               ),
//               trailing: Column(
//                 children: [
//                   Text(_products[index].productPrice),
//                   Text(_products[index].productPercentaje + "%")
//                 ],
//               ),
//             )