import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../Controllers/AttendanceController.dart';
// import '../../../Models/ScheduleModel.dart';
import 'CheckInOnlineFormScreen.dart';
import 'CheckOutOnlineFormScreen.dart';

class RemoteScreen extends GetView<AttendanceController> {
  @override
  Widget build(BuildContext context) {
    // ScheduleModel scheduleModel = Get.put(ScheduleModel());

    var currentTime = controller.time.value;
    // var scheduleStartTime = scheduleModel.startCheckinAt;
    var scheduleStartTime = controller.time.value;
    // var scheduleEndTime = scheduleModel.endCheckinAt;
    var scheduleEndTime = controller.time.value;
    controller.getCurrentLocation();
    controller.currentDate();
    const List<Tab> tabs = <Tab>[
      Tab(text: 'Check-in'),
      Tab(text: 'Check-out'),
    ];

    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Text('Remote Working', style: TextStyle(fontSize: 32)),
            ),
            TabBar(
              indicatorColor: Colors.amberAccent,
              tabs: tabs,
              labelColor: Colors.black,
            ),
            SingleChildScrollView(
              child: Container(
                color: HexColor('F5F5F5F5'),
                height: Get.height,
                child: TabBarView(children: [
                  controller.checkInStatus() && controller.checkSchedule()
                      ? CheckInForm()
                      : controller.showAlert(),
                  controller.checkOutStatus()
                      ? CheckOutForm()
                      : controller.showAlert()
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
