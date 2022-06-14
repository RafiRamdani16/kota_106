import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kota_106/CacheManager.dart';
import 'package:kota_106/Approval/OvertimeApproval/OvertimeApprovalController.dart';
import 'package:kota_106/Submission/AfterOvertime/AfterOvertimeModel.dart';
import 'package:time_range_picker/time_range_picker.dart';

import '../../APIService/ApiService.dart';
import '../../Approval/OvertimeApproval/OvertimeApprovalDetail/OvertimeApprovalModel.dart';


class OvertimeController extends GetxController with CacheManager {
  ApiClient _apiClient = Get.put(ApiClient(Dio()));
  AfterOvertimeModel afterOvertimeModel = Get.put(AfterOvertimeModel());
  TextEditingController overtimeDate = TextEditingController();
  TextEditingController overtimeDescription = TextEditingController();

  OvertimeApprovalModel overtimeEditModel =
      Get.put(OvertimeApprovalModel());

  Rx<DateTime> overtimeSelectedDate = DateTime.now().obs;
  Rx<TimeOfDay> overtimeStartTime = TimeOfDay(hour: 7, minute: 0).obs;
  Rx<TimeOfDay> overtimeEndTime = TimeOfDay(hour: 17, minute: 0).obs;
  RxString afterOvertimeAttachment = "".obs;
  int id = -1;
  String token = "";

  Rx<File> tmpFile = File('').obs;
  Rx<XFile> imageFile = XFile('').obs;
  ImagePicker _image = Get.put(ImagePicker());

  void overtimeDatePicker(BuildContext context) async {
    DateTime? newDate = await showDatePicker(
        context: context,
        initialDate: overtimeSelectedDate.value,
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 1, DateTime.january, 0));

    if (newDate == null) {
    } else {
      overtimeSelectedDate.value = newDate;
    }
  }

  void editOvertimeDatePicker(BuildContext context) async {
    DateTime? newDate = await showDatePicker(
        context: context,
        initialDate: overtimeSelectedDate.value,
        firstDate: DateTime(DateTime.now().year, DateTime.january),
        lastDate: DateTime(DateTime.now().year + 1, DateTime.january, 0));

    if (newDate == null) {
    } else {
      overtimeSelectedDate.value = newDate;
    }
  }

  void overtimeTimePicker(BuildContext context) async {
    TimeRange? newTime = await showTimeRangePicker(
      context: context,
      interval: Duration(minutes: 5),
      start: overtimeStartTime.value,
      end: overtimeEndTime.value,
      maxDuration: Duration(hours: 8),
      disabledColor: Colors.white,
      strokeColor: HexColor("FCBC45"),
      ticksColor: HexColor("FCBC45"),
      handlerColor: HexColor("FCBC45"),
      selectedColor: HexColor("FCBC45").withOpacity(0.5),
    );
    if (newTime == null) {
    } else {
      overtimeStartTime.value = newTime.startTime;
      overtimeEndTime.value = newTime.endTime;
    }
  }

  void overtimeForm() async {
    message("SUCCESS", "Pengajuan Lembur Berhasil");
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

  Widget setImageView(double height, double width) {
    if (imageFile.value.path != '') {
      tmpFile.value = File(imageFile.value.path);
      afterOvertimeAttachment.value =
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

  void getDetailOvertime(int overtimeId) {
    token = getToken()!;
    _apiClient.getDetailOvertime(id, token).then((response) {
      if (response.status == 200) {
        overtimeEditModel = response.data;
      } else {
        message("FAILED", "Terjadi Kesalahan");
      }
    });
  }

  // Future<void> afterOvertime(int idOvertime) async {
  //   id = getUserId()!;
  //   token = getToken()!;
  //   await _apiClient
  //       .getAfterOvertimeHistory("UserId = $id", "-CreatedAt", 1, 20, token)
  //       .then((response) {
  //     afterOvertimeModel = response.data.data.;
  //   });
  // }
}
