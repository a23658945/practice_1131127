import 'package:flutter/material.dart';

class Bottomna extends StatelessWidget {
  Bottomna({super.key});
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: items,
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.black, // 強制選中標籤為黑色
      unselectedItemColor: Colors.black, // 強制未選中標籤為黑
      onTap: (index) {
        _selectedIndex = index;
        if (_selectedIndex == 0) {
          Navigator.pushNamed(context, '/');
        } else if (_selectedIndex == 1) {
          Navigator.pushNamed(context, '/ExTextfield1');
        } else if (_selectedIndex == 2) {
          Navigator.pushNamed(context, '/ListPage');
        } else if (_selectedIndex == 3) {
          Navigator.pushNamed(context, '/GridView');
        } else if (_selectedIndex == 4) {
          Navigator.pushNamed(context, '/Listview0');
        } else {
          Navigator.pushNamed(context, '/exSingleChild');
          
        }
      },
      type: BottomNavigationBarType.fixed, // 防止圖標變形
      backgroundColor: Color.fromARGB(99, 87, 248, 0)
    );
  }
}

List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(
      icon: Icon(
        Icons.home_filled,
        color: Colors.black,
      ),
      label: 'Home',
      ),
  BottomNavigationBarItem(
      icon: Icon(
        Icons.list_rounded,
        color: Colors.black,
      ),
      label: 'ExTextfield1'),
  BottomNavigationBarItem(
      icon: Icon(
        Icons.catching_pokemon,
        color: Colors.black,
      ),
      label: 'ListPage'),
  BottomNavigationBarItem(
      icon: Icon(
        Icons.living_sharp,
        color: Colors.black,
      ),
      label: 'GridView'),
  BottomNavigationBarItem(
      icon: Icon(
        Icons.list_alt,
        color: Colors.black,
      ),
      label: 'Listview'),
  BottomNavigationBarItem(
      icon: Icon(
        Icons.expand_sharp,
        color: Colors.black,
      ),
      label: 'ExSingleChildScroll'),
];
