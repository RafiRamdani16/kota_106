import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../AttendanceController.dart';
import 'CheckIn/CheckinOfflineScreen.dart';
import 'CheckOut/CheckOutOfflineScreen.dart';
import 'package:sizer/sizer.dart';

class OfficePresensiPage extends GetView<AttendanceController> {
  @override
  Widget build(BuildContext context) {
    const List<Tab> tabs = <Tab>[
      Tab(text: 'Check-in'),
      Tab(text: 'Check-out'),
    ];

    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Column(
        children: <Widget>[
          Center(
            child: Text('Office Working', style: TextStyle(fontSize: 32)),
          ),
          TabBar(
            indicatorColor: Colors.amberAccent,
            tabs: tabs,
            labelColor: Colors.black,
          ),
          Container(
            color: HexColor('F5F5F5F5'),
            height: 40.h,
            child: Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: TabBarView(children: [
                // OfficeCheckInForm(),
                // OfficeCheckOutForm()
                Obx(() {
                  return controller.statusCheckinScan.value
                      ? CheckInOfflineScreen()
                      : controller.scanQRPage('check-in');
                }),
                Obx(() {
                  return controller.statusCheckoutScan.value
                      ? CheckOutOfflineScreen()
                      : controller.scanQRPage('check-out');
                })
              ]),
            ),
          )
        ],
      ),
    );
  }
}
