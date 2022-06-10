import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Controllers/AttendanceController.dart';
import 'OfficeCheckInForm.dart';
import 'OfficeCheckOutForm.dart';
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
                      ? OfficeCheckInForm()
                      : controller.scanQRPage('check-in');
                }),
                Obx(() {
                  return controller.statusCheckoutScan.value
                      ? OfficeCheckOutForm()
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
