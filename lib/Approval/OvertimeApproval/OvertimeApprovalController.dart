import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kota_106/APIService/ApiService.dart';
import 'package:kota_106/Approval/ApprovalModel.dart';
import 'package:kota_106/CacheManager.dart';

import '../AfterOvertimeApproval/DetailAfterOvertimeScreen.dart';

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

  List<ApprovalModel> overtimeApproval = <ApprovalModel>[];
  List<ApprovalModel> afterOvertimeApprovalModel = <ApprovalModel>[];

  Future<void> getOvertimeApplication() async {
    employeeId = getEmployeeId()!;
    token = getToken()!;
    try {
      await _apiClient
          .getApproval("UserIdApproval == $employeeId,SubmissionType==Overtime",
              "-SubmissionId", 1, 1000, token)
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
      print(e);
      message("ALERT", "Terjadi Kesalahan Jaringan");
    }
  }

  void giveOvertimeDecision(
      String decision, int approvalId, int submissionId) async {
    employeeId = getEmployeeId()!;
    token = getToken()!;
    String dateApproval = "${DateTime.now()}";
    try {
      await _apiClient
          .giveDecision(
        approvalId,
        employeeId,
        submissionId,
        decision,
        dateApproval,
        token,
      )
          .then((response) async {
        if (response.status == 200) {
          message("SUCCESS", "Keputusan Pengajuan Lembur Berhasil Diberikan");
        } else if (response.status == 401) {
          await _apiClient.getRefreshToken(employeeId, token).then((response) {
            removeToken();
            saveToken(token);
            giveOvertimeDecision(decision, approvalId, submissionId);
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

  Future<void> getAfterOvertime(int overtimeId, BuildContext context) async {
    employeeId = getEmployeeId()!;
    token = getToken()!;
    try {
      await _apiClient
          .getApproval(
              "OvertimeId == $overtimeId", "-SubmissionId", 1, 1000, token)
          .then((response) async {
        if (response.status == 200) {
          afterOvertimeApprovalModel = response.data.data;
          if (afterOvertimeApprovalModel.isEmpty) {
            message(
                "ALERT", "Tidak Ada Pengajuan Setelah Lembur Untuk Saat Ini");
          } else {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return DetailAfterOvertimeApproval();
                });
          }
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
      print(e);
      message("ALERT", "Terjadi Kesalahan Jaringan");
    }
  }

  void giveAfterOvertimeDecision(
      String decision, int approvalId, int submissionId) async {
    employeeId = getEmployeeId()!;
    token = getToken()!;
    String dateApproval = "${DateTime.now()}";
    try {
      await _apiClient
          .giveDecision(
        approvalId,
        employeeId,
        submissionId,
        decision,
        dateApproval,
        token,
      )
          .then((response) async {
        if (response.status == 200) {
          message("SUCCESS",
              "Keputusan Pengajuan Setelah Lembur Berhasil Diberikan");
        } else if (response.status == 401) {
          await _apiClient.getRefreshToken(employeeId, token).then((response) {
            removeToken();
            saveToken(token);
            giveAfterOvertimeDecision(decision, approvalId, submissionId);
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

  bool checkStatusOvertimeApproval(String status) {
    if (status == "Remaining") {
      return true;
    } else {
      return false;
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
