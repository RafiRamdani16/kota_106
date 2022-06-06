import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kota_106/Controllers/CacheManager.dart';
import 'package:kota_106/DummyData/DummyData.dart';

import '../Models/LeaveApplicationDecisionModel.dart';

class LeaveApplicationDecisionController extends GetxController
    with CacheManager {
  RxString employeeName = "".obs;
  RxString employeePosition = "".obs;
  RxString leaveDescription = "".obs;
  RxString leaveDate = "".obs;
  RxString leaveStartTime = "".obs;
  RxString leaveEndTime = "".obs;
  RxString leaveAttachment = "".obs;
  RxInt day = 0.obs;
  RxString month = "".obs;
  List<LeaveApplicationDecisionModel> leaveApplication =
      <LeaveApplicationDecisionModel>[];

  Future<void> getLeaveApplication() async {
    // DummyData dummyData = Get.put(DummyData());
    // leaveApplication = dummyData.leaveApplicationDummy;
    leaveApplication.add(LeaveApplicationDecisionModel()
      ..employeeName = "Rafi Ramdani"
      ..employeePosition = "Junior Programmer"
      ..leaveRemainingDays = "10 days"
      ..leaveDateSubmitted = "2022-08-10"
      ..leaveDescription = "Medical Checkup"
      ..leaveStartDate = "2022-08-15"
      ..leaveEndDate = "2022-08-16"
      ..leaveTimeSubmitted = "09:00"
      ..leaveType = "Sick Leave"
      ..leaveAttachment = "photo.jpg");

    leaveApplication.add(LeaveApplicationDecisionModel()
      ..employeeName = "Rafi Ramdani"
      ..employeePosition = "Junior Programmer"
      ..leaveRemainingDays = "5 days"
      ..leaveDateSubmitted = "2022-08-17"
      ..leaveDescription = "Dirawat dirumah sakit"
      ..leaveStartDate = "2022-08-18"
      ..leaveEndDate = "2022-08-21"
      ..leaveTimeSubmitted = "09:00"
      ..leaveType = "Sick Leave"
      ..leaveAttachment = "photo.jpg");
  }

  void formatDate(String rawDate) async {
    DateTime formatedDateTime = DateTime.parse(rawDate);
    day.value = formatedDateTime.day;

    month.value =
        DateFormat('MMMM').format(DateTime(0, formatedDateTime.month));
  }

  Widget setImageView(
      String photoName, double width, double height, String type) {
    return Image.asset(
      'assets/images/TestingSuketSakit2.jpg',
      width: width,
      height: height,
    );
  }
}
