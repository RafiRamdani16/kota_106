import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:kota_106/CacheManager.dart';
import 'package:kota_106/Approval/LeaveApproval/LeaveApprovalDetail/LeaveApprovalModel.dart';
import 'package:sizer/sizer.dart';

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

  Widget setEditImageView(String photoName, double height, double width) {
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
      return Image.network(
        'https://c736-2001-448a-3045-5919-813a-d9cd-df47-a5eb.ap.ngrok.io/$photoName',
        width: 100,
        height: 100,
      );
    }
  }

  Widget setImageView(double height, double width) {
    if (imageFile.value.path != '') {
      tmpFile.value = File(imageFile.value.path);
      leaveAttachment.value =
          "data:image/jpeg;base64,${base64Encode(File(imageFile.value.path).readAsBytesSync()).trim()}";
      return Image.file(
        tmpFile.value,
        height: height,
        width: width,
      );
    } else {
      return Image.asset(
        'assets/images/Icon/AccountBox.png',
        width: 100,
        height: 100,
      );
    }
  }

  void openCamera() async {
    try {
      imageFile.value = (await _image.pickImage(
          source: ImageSource.camera, imageQuality: 25))!;
    } catch (e) {
      // return 'Terjadi Kesalahan';
    }
  }

  Future<void> openGallery() async {
    try {
      imageFile.value = (await _image.pickImage(
          source: ImageSource.gallery, imageQuality: 25))!;
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
        leaveAttachment,
        token,
      )
          .then((response) {
        if (response.status == 200) {
          message("SUCCESS", "Pengajuan Cuti Berhasil");
          this.leaveType.clear();
          this.leaveDescription.clear();
          this.leaveRemaining.clear();
          imageFile.value = XFile("");
          setImageView(30.h, 30.h);
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

  Future<void> editLeaveForm(int leaveId, String leaveStartDate,
      String leaveEndDate, String leaveType, String leaveDescription) async {
    token = getToken()!;
    String leaveDateSubmit = "${DateTime.now()}";
    await _apiClient
        .editLeaveForm(
            leaveId,
            leaveDateSubmit,
            leaveStartDate,
            leaveEndDate,
            leaveType,
            leaveDescription,
            "data:image/jpeg;base64,${leaveAttachment.value}",
            token)
        .then((response) {
      if (response.status == 200) {
        this.leaveType.clear();
        this.leaveDescription.clear();
        this.leaveRemaining.clear();
        imageFile.value = XFile("");
        setImageView(30.h, 30.h);
        message("SUCCESS", " Pembaruan Pengajuan Cuti Berhasil");
      } else if (response.status == 401) {
        removeToken();
        saveToken(token);
        editLeaveForm(
            leaveId, leaveStartDate, leaveEndDate, leaveType, leaveDescription);
      } else {
        message("FAILED", "Terjadi Kesalahan Silahkan Ulangi Pengajuan");
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
