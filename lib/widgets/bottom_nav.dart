import 'package:flutter/material.dart';
import 'package:heirrand/orders/orders_screen.dart';
import '../screens/home_screen.dart';
import '../screens/wallet/wallet_screen.dart';
import '../services/helper.dart';


class NavbarItem {
  final String lightIcon;
  final String boldIcon;
  final String label;

  NavbarItem({required this.lightIcon, required this.boldIcon, required this.label});

  BottomNavigationBarItem item(bool isbold) {
    return BottomNavigationBarItem(
      icon: ImageLoader.imageAsset(isbold ? boldIcon : lightIcon),
      label: label,
    );
  }

  BottomNavigationBarItem get light => item(false);
  BottomNavigationBarItem get bold => item(true);
}

class BottomNavBar extends StatefulWidget {
  static const route = '/bnav';

  BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavBar> {
  int _select = 0;

  final screens = [
    const Homepage(),
    OrderScreen(title: "Orders"),
    WalletScreen(transactions: const [],),
    //const ProfileScreen(),
  ];

  static Image generateIcon(String path) {
    return Image.asset(
      '${ImageLoader.rootPaht}/buttomnav/$path',
      width: 24,
      height: 24,
    );
  }

  final List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined, color: Colors.yellowAccent,),
      activeIcon: Icon(Icons.home_filled, color: Colors.yellow,),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.motorcycle_outlined, color: Colors.yellowAccent,),
      activeIcon: Icon(Icons.motorcycle_rounded, color: Colors.yellow,),
      label: 'Orders',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.wallet_outlined, color: Colors.yellowAccent),
      activeIcon: Icon(Icons.wallet_rounded, color: Colors.yellow,),
      label: 'Wallet',
    ),
    //const BottomNavigationBarItem(
      //icon: Icon(Icons.notifications_none),
      //activeIcon: Icon(Icons.notifications_none),
      //label: 'Profile',
    //),
    // const BottomNavigationBarItem(
    //   icon: Icon(Icons.person),
    //   activeIcon: Icon(Icons.person),
    //   label: 'Profile',
    // ),
  ];

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: screens[_select],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        items: items,
        onTap: ((value) => setState(() => _select = value)),
        currentIndex: _select,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
        showUnselectedLabels: true,
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 10,
        ),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
      ),
    );
  }
}
