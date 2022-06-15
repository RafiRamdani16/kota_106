import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kota_106/APIService/ApiService.dart';
import 'package:kota_106/CacheManager.dart';


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

  String token = "";
  int employeeId = 0;

  ApiClient _apiClient = Get.put(ApiClient(Dio()));
  List<LeaveApprovalModel> leaveApplication = <LeaveApprovalModel>[];

  Future<void> getLeaveApproval() async {
    // DummyData dummyData = Get.put(DummyData());
    // leaveApplication = dummyData.leaveApplicationDummy;
    employeeId = getEmployeeId()!;
    token = getToken()!;

    try {
      await _apiClient
          .getLeaveApproval(
              "UserIdApproval3 == $employeeId", "", 1, 1000, token)
          .then((response) async {
        if (response.status == 200) {
          leaveApplication = response.data.data;
        } else if (response.status == 401) {
          await _apiClient.getRefreshToken(employeeId, token).then((response) {
            removeToken();
            saveToken(token);
            getLeaveApproval();
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
      String decision, LeaveApprovalModel leaveApprovalModel) async {
    employeeId = getEmployeeId()!;
    token = getToken()!;

    try {
      await _apiClient
          .editLeaveForm(
              leaveApprovalModel.leaveId,
              employeeId,
              token,
              leaveApprovalModel.leaveDateSubmitted,
              leaveApprovalModel.leaveStartDate,
              leaveApprovalModel.leaveEndDate,
              leaveApprovalModel.leaveType,
              leaveApprovalModel.leaveDescription,
              leaveApprovalModel.leaveAttachment,
              leaveApprovalModel.idApprovalAdmin,
              leaveApprovalModel.idApprovalHR,
              leaveApprovalModel.idApprovalAtasan,
              leaveApprovalModel.statusApprovalAdmin,
              leaveApprovalModel.statusApprovalHR,
              decision,
              leaveApprovalModel.dateApprovalAdmin,
              leaveApprovalModel.dateApprovalHR,
              "${DateTime.now()}")
          .then((response) async {
        if (response.status == 200) {
          message("SUCCESS", "Pengajuan Setelah Lembur Berhasil");
        } else if (response.status == 401) {
          await _apiClient.getRefreshToken(employeeId, token).then((response) {
            removeToken();
            saveToken(token);
            giveDecision(decision, leaveApprovalModel);
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
