import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kota_106/Controllers/AttendanceController/HistoryAttendanceController.dart';
import 'package:kota_106/Models/AttendanceModel.dart';


class DetailHistoryPresensiPage extends StatelessWidget {
  final AttendanceModel attendanceModel;
  DetailHistoryPresensiPage(this.attendanceModel);
  @override
  Widget build(BuildContext context) {
    HistoryAttendanceController controller =
        Get.put(HistoryAttendanceController());
    var screenHeightSize = MediaQuery.of(context).size.height;
    var screenWidthSize = MediaQuery.of(context).size.width;
    // final dataAttendance = this.attendanceModel;
    final AttendanceModel attendanceModel = this.attendanceModel;

    // int id = attendanceModel.id;
    controller.locationCheckin2.text = attendanceModel.locationCheckin;
    controller.locationCheckout.text = attendanceModel.locationCheckout;
    controller.doneList.text = attendanceModel.descriptionCheckout;
    controller.currentCheckinDate(attendanceModel.checkinAt);
    controller.currentCheckOutDate(attendanceModel.checkoutAt);
    
    return Center(
      child: AspectRatio(
        aspectRatio: 100 / 100,
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Attendance Detail',
                  style: TextStyle(fontSize: 16, fontFamily: 'Roboto'),
                ),
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/backgroundDetailHistory.png"),
                          fit: BoxFit.cover)),
                  width: screenWidthSize,
                  height: screenHeightSize,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Check-in Time:     ${controller.checkInTime} '),
                      Text('Check-out Time:   ${controller.checkOutTime}'),
                      Text('Work Time:          ${controller.workingTime}'),
                      Text('Check-in Location:'),
                      TextFormField(
                        enabled: false,
                        decoration: InputDecoration(
                            fillColor: Colors.white, filled: true),
                        style: TextStyle(fontSize: 12),
                        maxLines: 4,
                        controller: controller.locationCheckin2,
                      ),
                      Text('Check-out Location: '),
                      TextFormField(
                        enabled: false,
                        decoration: InputDecoration(
                            fillColor: Colors.white, filled: true),
                        style: TextStyle(fontSize: 12),
                        maxLines: 4,
                        controller: controller.locationCheckout,
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        spacing: 50,
                        children: [
                          Wrap(
                            direction: Axis.vertical,
                            runSpacing: 10,
                            spacing: 20,
                            children: [
                              Text('Check-in Photo:'),
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            controller.setImageView('namaUser'),
                                        fit: BoxFit.cover)),
                              )
                            ],
                          ),
                          Wrap(
                            direction: Axis.vertical,
                            runSpacing: 10,
                            spacing: 20,
                            children: [
                              Text('Check-in Date: '),
                              Text('  ${controller.checkInDate}'),
                              Text('Check-out Date'),
                              Text('  ${controller.checkOutDate}'),
                            ],
                          )
                        ],
                      ),
                      Text('Done List'),
                      TextFormField(
                        enabled: false,
                        decoration: InputDecoration(
                            fillColor: Colors.white, filled: true),
                        style: TextStyle(fontSize: 12),
                        maxLines: 4,
                        controller: controller.doneList,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
