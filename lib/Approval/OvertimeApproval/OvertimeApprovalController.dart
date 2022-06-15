import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kota_106/APIService/ApiService.dart';
import 'package:kota_106/Approval/AfterOvertimeApproval/AfterOvertimeApprovalModel.dart';
import 'package:kota_106/CacheManager.dart';

import 'OvertimeApprovalDetail/OvertimeApprovalModel.dart';

class OvertimeApprovalController extends GetxController with CacheManager {
  RxString employeeName = "".obs;
  RxString employeePosition = "".obs;
  RxString overtimeDescription = "".obs;
  RxString overtimeDate = "".obs;
  RxString overtimeStartTime = "".obs;
  RxString overtimeEndTime = "".obs;
  RxString overtimeAttachment = "".obs;
  RxInt day = 0.obs;
  RxString month = "".obs;

  TextEditingController description = TextEditingController();

  String token = "";
  int employeeId = 0;
  ApiClient _apiClient = Get.put(ApiClient(Dio()));
  AfterOvertimeApprovalModel afterOvertimeApprovalModel =
      Get.put(AfterOvertimeApprovalModel());
  List<OvertimeApprovalModel> overtimeApproval = <OvertimeApprovalModel>[];

  Future<void> getOvertimeApplication() async {
    employeeId = getEmployeeId()!;
    token = getToken()!;
    try {
      await _apiClient
          .getOvertimeApproval(
              "UserIdApproval3 == $employeeId", "", 1, 1000, token)
          .then((response) async {
        if (response.status == 200) {
          overtimeApproval = response.data.data;
        } else if (response.status == 401) {
          await _apiClient.getRefreshToken(employeeId, token).then((response) {
            removeToken();
            saveToken(token);
            getOvertimeApplication();
          });
        } else {
          message("ALERT",
              "Terjadi Kesalahan, Silahkan Coba Lagi Setelah Beberapa Saat");
        }
      });
    } catch (e) {
      message("ALERT", "Terjadi Kesalahan Jaringan");
    }
  }

  void giveDecision(
      String decision, OvertimeApprovalModel overtimeApprovalModel) async {
    employeeId = getEmployeeId()!;
    token = getToken()!;

    try {
      await _apiClient
          .editOvertimeForm(
              overtimeApprovalModel.overtimeId,
              employeeId,
              overtimeApprovalModel.afterOvertimeId,
              token,
              overtimeApprovalModel.overtimeDateSubmitted,
              overtimeApprovalModel.overtimeDate,
              overtimeApprovalModel.overtimeStartTime,
              overtimeApprovalModel.overtimeEndTime,
              overtimeApprovalModel.overtimeDescription,
              overtimeApprovalModel.idApprovalAdmin,
              overtimeApprovalModel.idApprovalHR,
              employeeId,
              overtimeApprovalModel.statusApprovalAdmin,
              overtimeApprovalModel.statusApprovalHR,
              decision,
              overtimeApprovalModel.dateApprovalAdmin,
              overtimeApprovalModel.dateApprovalHR,
              "${DateTime.now()}")
          .then((response) async {
        if (response.status == 200) {
          message("SUCCESS", "Pengajuan Setelah Lembur Berhasil");
        } else if (response.status == 401) {
          await _apiClient.getRefreshToken(employeeId, token).then((response) {
            removeToken();
            saveToken(token);
            giveDecision(decision, overtimeApprovalModel);
          });
        } else {
          message("ALERT",
              "Terjadi Kesalahan, Silahkan Coba Lagi Setelah Beberapa Saat");
        }
      });
    } catch (e) {
      message("ALERT", "Terjadi Kesalahan Jaringan");
    }
  }

  void getAfterOvertime() {}

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

  void message(String message, String content) {
    Get.defaultDialog(
      radius: 10.0,
      contentPadding: const EdgeInsets.all(20.0),
      title: message,
      titleStyle: TextStyle(fontFamily: 'ROBOTO'),
      middleText: content,
      textConfirm: 'Confirm',
      confirm: OutlinedButton.icon(
        onPressed: () => Get.back(),
        icon: const Icon(
          Icons.check,
          color: Colors.blue,
        ),
        label: const Text(
          'Confirm',
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}
