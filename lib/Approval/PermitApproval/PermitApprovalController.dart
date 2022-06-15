import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kota_106/CacheManager.dart';

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

  Future<void> getPermitApproval() async {
    employeeId = getEmployeeId()!;
    token = getToken()!;
    // DummyData dummyData = Get.put(DummyData());
    // permitApplication = dummyData.permitApplicationDummy;

    _apiClient
        .getPermitApproval("UserIdApproval3 == $employeeId", "", 1, 1000, token)
        .then((response) async {
      if (response.status == 200) {
        permitApplication = response.data.data;
      } else if (response.status == 401) {
        await _apiClient.getRefreshToken(employeeId, token).then((response) {
          removeToken();
          saveToken(token);
          getPermitApproval();
        });
      } else {
        message("ALERT",
            "Terjadi Kesalahan, Silahkan Coba Lagi Setelah Beberapa Saat");
      }
    });
  }

  void giveDecision(
      String decision, PermitApprovalModel permitApprovalModel) async {
    try {
      await _apiClient
          .editPermitForm(
              permitApprovalModel.permitId,
              employeeId,
              token,
              permitApprovalModel.permitDateSubmitted,
              permitApprovalModel.permitDate,
              permitApprovalModel.permitStartTime,
              permitApprovalModel.permitEndTime,
              permitApprovalModel.permitDescription,
              permitApprovalModel.permitAttachment,
              permitApprovalModel.idApprovalAdmin,
              permitApprovalModel.idApprovalHR,
              employeeId,
              permitApprovalModel.statusApprovalAdmin,
              permitApprovalModel.statusApprovalHR,
              decision,
              permitApprovalModel.dateApprovalAdmin,
              permitApprovalModel.dateApprovalHR,
              "${DateTime.now()}")
          .then((response) async {
        if (response.status == 200) {
          message("SUCCESS", "Pengajuan Setelah Lembur Berhasil");
        } else if (response.status == 401) {
          await _apiClient.getRefreshToken(employeeId, token).then((response) {
            removeToken();
            saveToken(token);
            giveDecision(decision, permitApprovalModel);
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
