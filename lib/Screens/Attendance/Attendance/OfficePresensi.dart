import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../Controllers/AttendanceController.dart';
import 'OfficeCheckInForm.dart';
import 'OfficeCheckOutForm.dart';

class OfficePresensiPage extends GetView<AttendanceController> {
  @override
  Widget build(BuildContext context) {
    // ScheduleModel scheduleModel = Get.put(ScheduleModel());
    GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
    // var statusScan = controller.statusScan.value;
    const List<Tab> tabs = <Tab>[
      Tab(text: 'Check-in'),
      Tab(text: 'Check-out'),
    ];
    controller.currentDate();
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: SingleChildScrollView(
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
              height: Get.height,
              child: TabBarView(children: [
                // controller.scanQRPage(qrKey),
                Obx(() {
                  return controller.statusCheckinScan.value 
                      ? OfficeCheckInForm()
                      : controller.scanQRPage(qrKey,'check-in');
                }),
                 Obx(() {
                  return controller.statusCheckoutScan.value
                      ? OfficeCheckOutForm()
                      : controller.scanQRPage(qrKey,'check-out');
                }),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
