import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kota_106/Controllers/HistoryController.dart';
import 'package:kota_106/Models/AttendanceModel.dart';
import 'package:sizer/sizer.dart';

class DetailHistoryPresensiPage extends StatelessWidget {
  final AttendanceModel attendanceModel;
  DetailHistoryPresensiPage(this.attendanceModel);
  @override
  Widget build(BuildContext context) {
    HistoryController controller = Get.put(HistoryController());
    var screenHeightSize = MediaQuery.of(context).size.height;
    var screenWidthSize = MediaQuery.of(context).size.width;
    // final dataAttendance = this.attendanceModel;
    final AttendanceModel attendanceModel = this.attendanceModel;

    // int id = attendanceModel.id;
    controller.locationCheckin2.text = attendanceModel.locationCheckin;
    controller.locationCheckout.text = attendanceModel.locationCheckout;
    controller.doneList.text = attendanceModel.descriptionCheckout;
    controller
        .changeFormatCheckinDateForAttendanceHistory(attendanceModel.checkinAt);
    controller.changeFormatCheckoutDateForAttendanceHistory(
        attendanceModel.checkoutAt);

    return Center(
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Attendance Detail',
                style: TextStyle(fontSize: 16.sp, fontFamily: 'Roboto'),
              ),
              Container(
                width: screenWidthSize,
                height: screenHeightSize,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Check-in Time:     ${controller.checkInTime} ',
                      style: TextStyle(fontSize: 12.sp),
                    ),
                    Text(
                      'Check-out Time:    ${controller.checkOutTime}',
                      style: TextStyle(fontSize: 12.sp),
                    ),
                    Text(
                      'Work Time:          ${controller.workingTime}',
                      style: TextStyle(fontSize: 12.sp),
                    ),
                    Text(
                      'Check-in Location:',
                      style: TextStyle(fontSize: 13.sp),
                    ),
                    TextFormField(
                      enabled: false,
                      decoration: InputDecoration(
                          fillColor: Colors.white, filled: true),
                      style: TextStyle(fontSize: 12.sp),
                      maxLines: 4,
                      controller: controller.locationCheckin2,
                    ),
                    Text(
                      'Check-out Location: ',
                      style: TextStyle(fontSize: 13.sp),
                    ),
                    TextFormField(
                      enabled: false,
                      decoration: InputDecoration(
                          fillColor: Colors.white, filled: true),
                      style: TextStyle(fontSize: 12.sp),
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
                            Text(
                              'Check-in Photo:',
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            controller.setImageView(attendanceModel.photoName,
                                100, 100, "Attendance"),
                          ],
                        ),
                        Wrap(
                          direction: Axis.vertical,
                          runSpacing: 10,
                          spacing: 20,
                          children: [
                            Text(
                              'Check-in Date: ',
                              style: TextStyle(fontSize: 13.sp),
                            ),
                            Text(
                              '  ${controller.checkInDate}',
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            Text(
                              'Check-out Date',
                              style: TextStyle(fontSize: 13.sp),
                            ),
                            Text(
                              '  ${controller.checkOutDate}',
                              style: TextStyle(fontSize: 12.sp),
                            ),
                          ],
                        )
                      ],
                    ),
                    Text(
                      'Done List',
                      style: TextStyle(fontSize: 13.sp),
                    ),
                    TextFormField(
                      enabled: false,
                      decoration: InputDecoration(
                          fillColor: Colors.white, filled: true),
                      style: TextStyle(fontSize: 12.sp),
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
    );
  }
}
