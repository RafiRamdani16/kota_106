import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kota_106/CacheManager.dart';
import 'package:kota_106/Approval/PermitApproval/PermitApprovalDetail/PermitApprovalModel.dart';
import 'package:time_range_picker/time_range_picker.dart';

import '../../APIService/ApiService.dart';

class PermitController extends GetxController with CacheManager {
  TextEditingController permitDate = TextEditingController();

  TextEditingController permitDescription = TextEditingController();
  ApiClient _apiClient = Get.put(ApiClient(Dio()));

  PermitApprovalModel permitModel = Get.put(PermitApprovalModel());

  int employeeId = -1;
  String token = "";
  Rx<File> tmpFile = File('').obs;
  Rx<XFile> imageFile = XFile('').obs;
  ImagePicker _image = Get.put(ImagePicker());
  Rx<DateTime> permitSelectedDate = DateTime.now().obs;
  var permitStartTime = TimeOfDay(hour: 8, minute: 0).obs;
  var permitEndTime = TimeOfDay(hour: 12, minute: 0).obs;
  RxString permitAttachment = "".obs;

  void permitDatePicker(BuildContext context) async {
    DateTime? newDate = await showDatePicker(
        context: context,
        initialDate: permitSelectedDate.value,
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 1, DateTime.january, 0));

    if (newDate == null) {
    } else {
      permitSelectedDate.value = newDate;
    }
  }

  void editPermitDatePicker(BuildContext context) async {
    DateTime? newDate = await showDatePicker(
        context: context,
        initialDate: permitSelectedDate.value,
        firstDate: DateTime(DateTime.now().year, DateTime.january),
        lastDate: DateTime(DateTime.now().year + 1, DateTime.january, 0));
    if (newDate == null) {
    } else {
      permitSelectedDate.value = newDate;
    }
  }

  void permitTimePicker(BuildContext context) async {
    TimeRange? newTime = await showTimeRangePicker(
      context: context,
      interval: Duration(minutes: 5),
      start: permitStartTime.value,
      end: permitEndTime.value,
      maxDuration: Duration(hours: 4),
      disabledTime: TimeRange(
          startTime: TimeOfDay(hour: 17, minute: 1),
          endTime: TimeOfDay(hour: 7, minute: 59)),
      disabledColor: Colors.white,
      strokeColor: HexColor("FCBC45"),
      ticksColor: HexColor("FCBC45"),
      handlerColor: HexColor("FCBC45"),
      selectedColor: HexColor("FCBC45").withOpacity(0.5),
    );
    if (newTime == null) {
    } else {
      permitStartTime.value = newTime.startTime;
      permitEndTime.value = newTime.endTime;
    }
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

  Widget setEditImageView(String photoName, double height, double width) {
    if (imageFile.value.path != '') {
      tmpFile.value = File(imageFile.value.path);
      permitAttachment.value =
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
      permitAttachment.value =
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
      imageFile.value = (await _image.pickImage(
          source: ImageSource.camera, imageQuality: 25))!;
      print(imageFile.value.name);
      permitAttachment.value = imageFile.value.name;
    } catch (e) {
      // return 'Terjadi Kesalahan';
    }
  }

  Future<void> openGallery() async {
    try {
      imageFile.value = (await _image.pickImage(
          source: ImageSource.gallery, imageQuality: 25))!;
      print(imageFile.value.name);
      permitAttachment.value = imageFile.value.name;
    } catch (e) {
      // return 'Terjadi Kesalahan';
    }
  }

  Future<void> permitForm(
      String permitDate,
      String permitStartTime,
      String permitEndTime,
      String permitDescription,
      String permitAttachment) async {
    employeeId = getEmployeeId()!;
    token = getToken()!;
    String permitDateSubmit = "${DateTime.now()}";
    try {
      await _apiClient
          .submissionForm(
        employeeId,
        0,
        permitDateSubmit,
        permitDate,
        permitStartTime,
        permitEndTime,
        "Permit",
        permitDescription,
        'data:image/jpeg;base64,${this.permitAttachment.value}',
        token,
      )
          .then((response) {
        if (response.status == 200) {
          message("SUCCESS", "Pengajuan Izin Berhasil");
        } else if (response.status == 401) {
          _apiClient.getRefreshToken(employeeId, token).then((response) {
            removeToken();
            saveToken(token);
            permitForm(permitDate, permitStartTime, permitEndTime,
                permitDescription, permitAttachment);
          });
        } else {
          message("FAILED", "Terjadi Kesalahan Silahkan Ulangi Pengajuan");
        }
      });
    } catch (e) {
      print("error $e");
      message("ALERT", "Terjadi Kesalahan Jaringan");
    }
  }

  Future<void> editPermitForm(
      int permitId,
      String permitDate,
      String permitStartTime,
      String permitEndTime,
      String permitDescription) async {
    employeeId = getEmployeeId()!;
    token = getToken()!;
    String permitDateSubmit = "${DateTime.now()}";
    try {
      await _apiClient
          .editSubmissionForm(
              permitId,
              permitDateSubmit,
              permitDate,
              permitStartTime,
              permitEndTime,
              permitDescription,
              'data:image/jpeg;base64,${this.permitAttachment.value}',
              token)
          .then((response) {
        if (response.status == 200) {
          message("SUCCESS", "Pembaruan Pengajuan Izin Berhasil");
        } else if (response.status == 401) {
          _apiClient.getRefreshToken(employeeId, token).then((response) {
            removeToken();
            saveToken(token);
            editPermitForm(permitId, permitDate, permitStartTime, permitEndTime,
                permitDescription);
          });
        } else {
          message("FAILED", "Terjadi Kesalahan Silahkan Ulangi Pengajuan");
        }
      });
    } catch (e) {
      print("error $e");
      message("ALERT", "Terjadi Kesalahan Jaringan");
    }
  }
}
