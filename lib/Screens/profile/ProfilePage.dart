import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/Authentication.dart';


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthenticationManager authenticationManager =
        Get.put(AuthenticationManager());
    var _selectedIndex = 0.obs;
    return Scaffold(
      body: Container(
        height: 300,
        width: 400,
        child: ElevatedButton(
            onPressed: () {
              authenticationManager.logout();
            },
            child: Text('Logout')),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.fingerprint_outlined),
              label: "home",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time_outlined),
              label: "histori",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.announcement),
              label: "announcement",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: "profile",
              backgroundColor: Colors.black)
        ],
        currentIndex: _selectedIndex.value,
        onTap: (index) {
          if (index == 0) {
            _selectedIndex.value = index;
            Get.toNamed('/');
          } else if (index == 1) {
            _selectedIndex.value = index;
            Get.toNamed('/historyPage');
          } else if (index == 2) {
            _selectedIndex.value = index;
          } else if (index == 3) {
            _selectedIndex.value = index;
            Get.toNamed('/profilePage');
          }
        },
        selectedItemColor: Colors.amber,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
