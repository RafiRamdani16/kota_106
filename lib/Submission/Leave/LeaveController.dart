import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


import 'package:kota_106/CacheManager.dart';
import 'package:kota_106/Approval/LeaveApproval/LeaveApprovalDetail/LeaveApprovalModel.dart';

import '../../APIService/ApiService.dart';

class LeaveController extends GetxController with CacheManager {
  TextEditingController leaveType = TextEditingController();
  TextEditingController leaveRemaining = TextEditingController();
  TextEditingController leaveDescription = TextEditingController();
  TextEditingController remainingDays = TextEditingController();

  RxString selectedType = "Annual Leave".obs;
  Rx<File> tmpFile = File('').obs;
  Rx<XFile> imageFile = XFile('').obs;
  ImagePicker _image = Get.put(ImagePicker());
  ApiClient _apiClient = Get.put(ApiClient(Dio()));

  int employeeId = -1;
  String token = "";

  LeaveApprovalModel leaveEditModel = Get.put(LeaveApprovalModel());

  var startLeaveDate = DateTime.now().obs;
  var endLeaveDate = DateTime.now().add(Duration(days: 7)).obs;
  var currentDate = DateTime.now();

  RxString leaveAttachment = "".obs;
  DateTimeRange leaveDateTimeRange = DateTimeRange(
      start: DateTime.now(), end: DateTime.now().add(Duration(days: 31)));

  // List<DropdownMenuItem<String>> typeLeave = [
  //   DropdownMenuItem(
  //     child: Text(
  //       "Annual Leave",
  //       style: TextStyle(fontSize: 11.sp),
  //     ),
  //     value: "Annual Leave",
  //   ),
  //   DropdownMenuItem(
  //     child: Text("Sick Leave", style: TextStyle(fontSize: 11.sp)),
  //     value: "Sick Leave",
  //   ),
  //   DropdownMenuItem(
  //     child: Text("Other Leave", style: TextStyle(fontSize: 11.sp)),
  //     value: "Other Leave",
  //   ),
  // ];

  void pickLeaveDate(BuildContext context) async {
    DateTimeRange? newLeaveDateTime = await showDateRangePicker(
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        context: context,
        initialDateRange: leaveDateTimeRange,
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 1, DateTime.january, 0));

    if (newLeaveDateTime == null) {
      print("gagal");
      Get.back();
    } else {
      leaveDateTimeRange = newLeaveDateTime;
    }

    startLeaveDate.value = leaveDateTimeRange.start;
    endLeaveDate.value = leaveDateTimeRange.end;
  }

  Widget setImageView(double height, double width) {
    if (imageFile.value.path != '') {
      tmpFile.value = File(imageFile.value.path);
      leaveAttachment.value =
          base64Encode(File(imageFile.value.path).readAsBytesSync()).trim();
      return Image.file(
        tmpFile.value,
        height: height,
        width: width,
      );
    } else {
      // photoName.value = 'assets/images/Icon/AccountBox.png';
      return Image.asset(
        'assets/images/Icon/AccountBox.png',
        width: 100,
        height: 100,
      );
    }
  }

  void openCamera() async {
    try {
      imageFile.value = (await _image.pickImage(source: ImageSource.camera))!;
    } catch (e) {
      // return 'Terjadi Kesalahan';
    }
  }

  Future<void> openGallery() async {
    try {
      imageFile.value = (await _image.pickImage(source: ImageSource.gallery))!;
    } catch (e) {
      // return 'Terjadi Kesalahan';
    }
  }

  Future<void> leaveForm(
      String leaveType,
      String leaveStartDate,
      String leaveEndDate,
      String leaveDescription,
      String leaveAttachment) async {
    employeeId = getEmployeeId()!;
    token = getToken()!;

    String leaveDateSubmit = "${DateTime.now()}";
    try {
      await _apiClient
          .leaveForm(
        employeeId,
        leaveDateSubmit,
        leaveStartDate,
        leaveEndDate,
        leaveType,
        leaveDescription,
        'data:image/jpeg;base64,$leaveAttachment',
        token,
      )
          .then((response) {
        if (response.status == 200) {
          message("SUCCESS", "Pengajuan Cuti Berhasil");
        } else if (response.status == 401) {
          removeToken();
          saveToken(token);
          leaveForm(leaveType, leaveStartDate, leaveEndDate, leaveDescription,
              leaveAttachment);
        } else {
          message("FAILED", "Terjadi Kesalahan Silahkan Ulangi Pengajuan");
        }
      });
    } catch (e) {
      message("ALERT", "Terjadi Kesalahan Jaringan");
    }
  }

  void getDetailLeave(int leaveId) {
    token = getToken()!;
    _apiClient.getDetailLeave(leaveId, token).then((response) {
      if (response.status == 200) {
        leaveEditModel = response.data;
      }
    });
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
