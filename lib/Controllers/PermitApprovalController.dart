import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kota_106/Controllers/CacheManager.dart';
import 'package:kota_106/DummyData/DummyData.dart';
import 'package:kota_106/Models/PermitApplicationDecisionModel.dart';

class PermitApprovalController extends GetxController with CacheManager {
  RxString employeeName = "".obs;
  RxString employeePosition = "".obs;
  RxString permitDescription = "".obs;
  RxString permitDate = "".obs;
  RxString permitStartTime = "".obs;
  RxString permitEndTime = "".obs;
  RxString permitAttachment = "".obs;
  RxInt day = 0.obs;
  RxString month = "".obs;
  List<PermitApplicationDecisionModel> permitApplication =
      <PermitApplicationDecisionModel>[];

  Future<void> getPermitApplication() async {
    // DummyData dummyData = Get.put(DummyData());
    // permitApplication = dummyData.permitApplicationDummy;
    permitApplication.add(PermitApplicationDecisionModel()
      ..employeeName = "Azhar Bani Rashif"
      ..employeePosition = "Junior Programmer"
      ..permitDateSubmitted = "2022-09-18"
      ..permitTimeSubmitted = "09.00"
      ..permitStartTime = "13:00"
      ..permitDate = "2022-10-17"
      ..permitDescription = "Izin Ke bank ke 17"
      ..permitEndTime = "15:00"
      ..permitAttachment = "Photo.jpg");

    permitApplication.add(PermitApplicationDecisionModel()
      ..employeeName = "Fahreza Ramadhani"
      ..employeePosition = "Junior Programmer"
      ..permitDateSubmitted = "2022-09-18"
      ..permitTimeSubmitted = "09.00"
      ..permitStartTime = "13:00"
      ..permitDate = "2022-10-17"
      ..permitDescription = "Izin Ke bank ke 17"
      ..permitEndTime = "15:00"
      ..permitAttachment = "Photo.jpg");
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
