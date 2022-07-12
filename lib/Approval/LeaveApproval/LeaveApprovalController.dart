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
    employeeId = getEmployeeId()!;
    token = getToken()!;

    try {
      await _apiClient
          .getLeaveApproval(
              "UserIdApproval == $employeeId, StatusApproval==Remaining",
              "",
              1,
              1000,
              token)
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

  void giveDecision(String decision, int approvalId, int submissionId) async {
    employeeId = getEmployeeId()!;
    token = getToken()!;
    String dateApproval = "${DateTime.now()}";
    try {
      await _apiClient
          .giveDecision(approvalId, employeeId, submissionId, decision,
              dateApproval, token)
          .then((response) async {
        if (response.status == 200) {
          message("SUCCESS", "Keputusan Pengajuan Cuti Berhasil Diberikan");
        } else if (response.status == 401) {
          await _apiClient.getRefreshToken(employeeId, token).then((response) {
            removeToken();
            saveToken(token);
            giveDecision(decision, approvalId, submissionId);
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
    return Image.network(
      'https://62fe-2001-448a-304b-15a6-14bf-8f81-47ae-195d.ngrok.io/$photoName',
      width: width,
      height: height,
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return Text("Tidak ada Attachment");
      },
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
        onPressed: () {
          Get.back();
        },
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
