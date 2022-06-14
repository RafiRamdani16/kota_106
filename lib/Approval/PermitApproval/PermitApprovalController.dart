import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kota_106/CacheManager.dart';
import 'package:kota_106/DummyData/DummyData.dart';
import 'package:kota_106/Approval/PermitApproval/PermitApprovalDetail/PermitApprovalModel.dart';

import '../../APIService/ApiService.dart';

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
  int employeeId = 0;
  String token = "";
  ApiClient _apiClient = Get.put(ApiClient(Dio()));

  List<PermitApprovalModel> permitApplication = <PermitApprovalModel>[];

  Future<void> getPermitApplication() async {
    employeeId = getEmployeeId()!;
    token = getToken()!;
    // DummyData dummyData = Get.put(DummyData());
    // permitApplication = dummyData.permitApplicationDummy;

    _apiClient
        .getPermitApproval("UserIdApproval3 == $employeeId", "", 1, 1000, token)
        .then((response) {
      if (response.status == 200) {
        // permitApplication = response.data;
      }
    });
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
