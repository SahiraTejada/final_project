import 'package:final_project/models/user_model.dart';
import 'package:final_project/screens/orders_screen.dart';
import 'package:final_project/screens/overview_screen.dart';
import 'package:final_project/screens/products_screen.dart';
import 'package:final_project/screens/users_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/navbar.dart';
import '../widgets/side_menu.dart';

class SharedLayout extends StatefulWidget {
  const SharedLayout({Key? key, required this.loggedInUser}) : super(key: key);

  final UserModel loggedInUser;
  @override
  State<SharedLayout> createState() => _SharedLayoutState();
}

class _SharedLayoutState extends State<SharedLayout> {
  int currentPageIndex = 0;
  List<String> pageTitles = ['Overview', 'Users', 'Products', 'Orders'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      drawer: SideMenu(loggedInUser: widget.loggedInUser),
      appBar: AppBar(
        title: Text(pageTitles[currentPageIndex]),
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu),
            );
          },
        ),
      ),
      bottomNavigationBar: NavBar(
          index: currentPageIndex,
          onTap: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          }),
      body: <Widget>[
        const OverviewScreen(),
        const UsersScreen(),
        const ProductsScreen(),
        const OrdersScreen()
      ][currentPageIndex],
    );
  }
}
