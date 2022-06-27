import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kota_106/CacheManager.dart';

import 'package:kota_106/Submission/AfterOvertime/AfterOvertimeModel.dart';
import 'package:time_range_picker/time_range_picker.dart';

import '../../APIService/ApiService.dart';

class OvertimeController extends GetxController with CacheManager {
  ApiClient _apiClient = Get.put(ApiClient(Dio()));
  AfterOvertimeModel afterOvertimeModel = Get.put(AfterOvertimeModel());
  TextEditingController overtimeDate = TextEditingController();
  TextEditingController overtimeDescription = TextEditingController();

  Rx<DateTime> overtimeSelectedDate = DateTime.now().obs;
  Rx<TimeOfDay> overtimeStartTime = TimeOfDay(hour: 17, minute: 0).obs;
  Rx<TimeOfDay> overtimeEndTime = TimeOfDay(hour: 18, minute: 0).obs;
  RxString afterOvertimeAttachment = "".obs;
  int employeeId = -1;
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
      disabledTime: TimeRange(
          startTime: TimeOfDay(hour: 7, minute: 59),
          endTime: TimeOfDay(hour: 17, minute: 1)),
      maxDuration: Duration(hours: 6),
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

  void overtimeForm(String overtimeDate, String overtimeStartTime,
      String overtimeEndTime, String overtimeDescription) async {
    String overtimeSubmit = "${DateTime.now()}";
    token = getToken()!;
    employeeId = getEmployeeId()!;
    try {
      await _apiClient
          .submissionForm(
              employeeId,
              0,
              overtimeSubmit,
              overtimeDate,
              overtimeStartTime,
              overtimeEndTime,
              "Overtime",
              overtimeDescription,
              "",
              token)
          .then(
        (response) {
          if (response.status == 200) {
            this.overtimeDate.clear();
            this.overtimeDescription.clear();
            message("SUCCESS", "Pengajuan Lembur Berhasil");
          } else if (response.status == 401) {
            _apiClient.getRefreshToken(employeeId, token).then((response) {
              removeToken();
              saveToken(token);
              overtimeForm(overtimeDate, overtimeStartTime, overtimeEndTime,
                  overtimeDescription);
            });
          } else {
            message("FAILED", "Terjadi Kesalahan Silahkan Ulangi Pengajuan");
          }
        },
      );
    } catch (e) {
      print(token);
      print("error $e");
      message("ALERT", "Terjadi Kesalahan Jaringan");
    }
  }

  Future<void> editOvertimeForm(
    int overtimeId,
    String overtimeDate,
    String overtimeStartTime,
    String overtimeEndTime,
    String overtimeDescription,
  ) async {
    token = getToken()!;
    String overtimeSubmit = "${DateTime.now()}";
    await _apiClient
        .editSubmissionForm(overtimeId, overtimeSubmit, overtimeDate,
            overtimeStartTime, overtimeEndTime, overtimeDescription, "", token)
        .then((response) {
      if (response.status == 200) {
        this.overtimeDate.clear();
        this.overtimeDescription.clear();
        message("SUCCESS", "Pembaruan Pengajuan Lembur Berhasil");
      } else if (response.status == 401) {
        _apiClient.getRefreshToken(employeeId, token).then((response) {
          removeToken();
          saveToken(token);
          editOvertimeForm(overtimeId, overtimeDate, overtimeStartTime,
              overtimeEndTime, overtimeDescription);
        });
      } else {
        message("FAILED", "Terjadi Kesalahan Silahkan Ulangi Pengajuan");
      }
    });
  }

  Future<void> afterOvertimeForm(
      int overtimeId,
      String overtimeDate,
      String overtimeStartTime,
      String overtimeEndTime,
      String overtimeDescription,
      String overtimeAttachment) async {
    employeeId = getEmployeeId()!;
    token = getToken()!;
    String afterOvertimeSubmitDate = "${DateTime.now()}";

    try {
      await _apiClient
          .submissionForm(
        employeeId,
        overtimeId,
        afterOvertimeSubmitDate,
        overtimeDate,
        overtimeStartTime,
        overtimeEndTime,
        "AfterOvertime",
        overtimeDescription,
        'data:image/jpeg;base64,$overtimeAttachment',
        token,
      )
          .then((response) {
        if (response.status == 200) {
          this.overtimeDate.clear();
          this.overtimeDescription.clear();
        
          message("SUCCESS", "Pengajuan Setelah Lembur Berhasil");
        } else if (response.status == 401) {
          _apiClient.getRefreshToken(employeeId, token).then((response) {
            removeToken();
            saveToken(token);
            afterOvertimeForm(overtimeId, overtimeDate, overtimeStartTime,
                overtimeEndTime, overtimeDescription, overtimeAttachment);
          });
        } else {
          message("FAILED", "Terjadi Kesalahan Silahkan Ulangi Pengajuan");
        }
      });
    } catch (e) {
      message("ALERT", "Terjadi Kesalahan Jaringan");
    }
  }

  Future<void> editAfterOvertimeForm(
    int afterOvertimeId,
    String afterOvertimeDate,
    String afterOvertimeStartTime,
    String afterOvertimeEndTime,
    String afterOvertimeDescription,
  ) async {
    token = getToken()!;
    String overtimeSubmit = "${DateTime.now()}";
    await _apiClient
        .editSubmissionForm(
            afterOvertimeId,
            overtimeSubmit,
            afterOvertimeDate,
            afterOvertimeStartTime,
            afterOvertimeEndTime,
            afterOvertimeDescription,
            'data:image/jpeg;base64,$afterOvertimeAttachment',
            token)
        .then((response) {
      if (response.status == 200) {
        this.overtimeDate.clear();
        this.overtimeDescription.clear();

        message("SUCCESS", "Pembaruan Pengajuan Lembur Berhasil");
      } else if (response.status == 401) {
        _apiClient.getRefreshToken(employeeId, token).then((response) {
          removeToken();
          saveToken(token);
          editAfterOvertimeForm(
              afterOvertimeId,
              afterOvertimeDate,
              afterOvertimeStartTime,
              afterOvertimeEndTime,
              afterOvertimeDescription);
        });
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

  Widget setEditImageView(String photoName, double height, double width) {
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
      return Image.network(
        "https://c736-2001-448a-3045-5919-813a-d9cd-df47-a5eb.ap.ngrok.io/$photoName",
        height: height,
        width: width,
      );
    }
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
