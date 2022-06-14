import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kota_106/CacheManager.dart';
import 'package:kota_106/DummyData/DummyData.dart';

import 'LeaveApprovalDetail/LeaveApprovalModel.dart';

class LeaveApprovalController extends GetxController with CacheManager {
  RxString employeeName = "".obs;
  RxString employeePosition = "".obs;
  RxString leaveDescription = "".obs;
  RxString leaveDate = "".obs;
  RxString leaveStartTime = "".obs;
  RxString leaveEndTime = "".obs;
  RxString leaveAttachment = "".obs;
  RxInt day = 0.obs;
  RxString month = "".obs;
  List<LeaveApprovalModel> leaveApplication = <LeaveApprovalModel>[];

  Future<void> getLeaveApplication() async {
    // DummyData dummyData = Get.put(DummyData());
    // leaveApplication = dummyData.leaveApplicationDummy;
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
