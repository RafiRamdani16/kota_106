import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'HistoryLeave/HistoryLeavePage.dart';
import 'HistoryOvertime/HistoryOvertimePage.dart';
import 'HistoryPermit/HistoryPermitPage.dart';
import 'HistoryPresensi/HistoryPresensiPage.dart';
import 'HistoryReimburse/HistoryReimbursePage.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _selectedIndex = 0.obs;
    var screenHeightSize = MediaQuery.of(context).size.height;
    List<Widget> tabs = <Widget>[
      Container(width: 75, child: Tab(text: 'Attendance')),
      Container(width: 70, child: Tab(text: 'Overtime')),
      Container(width: 70, child: Tab(text: 'Leave')),
      Container(width: 70, child: Tab(text: 'Permit')),
      Container(width: 70, child: Tab(text: 'Reimburse')),
    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('History',
            style: TextStyle(fontSize: 32, color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: DefaultTabController(
        length: 5,
        initialIndex: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(bottom: 10)),
            TabBar(
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.amberAccent,
              tabs: tabs,
              unselectedLabelColor: Colors.black,
              labelColor: Colors.amberAccent,
            ),
            Container(
              color: HexColor('F5F5F5'),
              height: screenHeightSize /2 + 173,
              child: TabBarView(children: [
                HistoryPresensiPage(),
                HistoryOvertimePage(),
                HistoryLeavePage(),
                HistoryPermitPage(),
                HistoryReimbursePage()
              ]),
            )
          ],
        ),
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
              label: "history",
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
