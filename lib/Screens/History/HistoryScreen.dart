import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kota_106/Screens/History/History%20Activity%20Record/HistoryActivityRecord.dart';

import 'HistoryAttendance/HistoryPresensiPage.dart';
import 'HistoryLeave/LeaveHistoryScreen.dart';
import 'HistoryOvertime/OvertimeHistoryScreen.dart';
import 'HistoryPermit/PermitHistoryScreen.dart';


class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var _selectedIndex = 1.obs;
    List<Widget> tabs = <Widget>[
      Container(width: 75, child: Tab(text: 'Attendance')),
      Container(width: 70, child: Tab(text: 'Overtime')),
      Container(width: 70, child: Tab(text: 'Leave')),
      Container(width: 70, child: Tab(text: 'Permit')),
      Container(width: 100, child: Tab(text: 'Activity Record')),
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('History',
            style: TextStyle(fontSize: 32, color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: DefaultTabController(
        length: 5,
        initialIndex: 0,
        child: Wrap(
          spacing: 10,
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
              height: Get.height - 170,
              width: Get.width,
              child: TabBarView(children: [
                AttendanceHistoryScreen(),
                HistoryOvertimePage(),
                LeaveHistoryScreen(),
                PermitHistoryScreen(),
                HistoryActivityRecord(),
              ]),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        backgroundColor: Colors.black,
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
              icon: Icon(Icons.person),
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
            Get.toNamed('/historyScreen');
          } else if (index == 2) {
            _selectedIndex.value = index;
            Get.toNamed('/profileScreen');
          }
        },
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
