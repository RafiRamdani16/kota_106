import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../AttendanceController.dart';
// import '../../../Models/ScheduleModel.dart';
import 'CheckIn/CheckInOnlineFormScreen.dart';
import 'CheckOut/CheckOutOnlineFormScreen.dart';
import 'package:sizer/sizer.dart';
class RemoteScreen extends GetView<AttendanceController> {
  @override
  Widget build(BuildContext context) {
    // ScheduleModel scheduleModel = Get.put(ScheduleModel());

    // var currentTime = controller.time.value;
    // // var scheduleStartTime = scheduleModel.startCheckinAt;
    // var scheduleStartTime = controller.time.value;
    // // var scheduleEndTime = scheduleModel.endCheckinAt;
    // var scheduleEndTime = controller.time.value;
    
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
            child: Text('Remote Working', style: TextStyle(fontSize: 32)),
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
                controller.checkInStatus()
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
    );
  }
}
