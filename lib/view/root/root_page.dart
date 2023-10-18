import 'package:cart_app_synkrama/view/home/home_page.dart';
import 'package:cart_app_synkrama/view/order/order_page.dart';
import 'package:cart_app_synkrama/view/profile/profile_page.dart';
import 'package:flutter/material.dart';

class DashBoardRoot extends StatefulWidget {
  const DashBoardRoot({super.key});

  @override
  State<DashBoardRoot> createState() => _DashBoardRootState();
}

class _DashBoardRootState extends State<DashBoardRoot> {
  static const List<Widget> _body = [
    HomePage(),
    OrderPage(),
    ProfilePage(),
    // ReceiptPage()
  ];
  int bodyIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body[bodyIndex],
      bottomNavigationBar: Theme(
        data: ThemeData(),
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.grey),
              label: 'Home',
              activeIcon: Icon(
                Icons.home,
                color: Colors.deepPurple,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.grey,
              ),
              label: 'Order',
              activeIcon: Icon(
                Icons.shopping_cart,
                color: Colors.deepPurple,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.grey,
              ),
              label: 'Profile',
              activeIcon: Icon(
                Icons.person,
                color: Colors.deepPurple,
              ),
            ),
          ],
          onTap: (value) => _bottomBarItemSelected(value),
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.grey,
          currentIndex: bodyIndex,
        ),
      ),
    );
  }

  _bottomBarItemSelected(int value) {
    bodyIndex = value;
    setState(() {});
  }
}
