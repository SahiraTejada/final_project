import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key, required this.onTap, required this.index})
      : super(key: key);
  final Function(int) onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Overview',
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Users',
            icon: Icon(Icons.person_4_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Products',
            icon: Icon(Icons.shopping_bag_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Orders',
            icon: Icon(Icons.shop_2_outlined),
          ),
        ],
        currentIndex: index,
        onTap: onTap,
      ),
    );
  }
}
