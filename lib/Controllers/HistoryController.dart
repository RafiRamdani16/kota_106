import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:kota_106/Controllers/APIService/ApiService.dart';
import 'package:kota_106/Controllers/CacheManager.dart';
import 'package:kota_106/DummyData/DummyData.dart';
import 'package:kota_106/Models/ActivityRecordModel.dart';
import 'package:kota_106/Models/AttendanceModel.dart';

class HistoryController extends GetxController with CacheManager {
  TextEditingController locationCheckin2 = TextEditingController();
  TextEditingController locationCheckout = TextEditingController();
  TextEditingController doneList = TextEditingController();
  TextEditingController locationNow = TextEditingController();
  TextEditingController dateNow = TextEditingController();
  TextEditingController timeNow = TextEditingController();
  TextEditingController description = TextEditingController();

  RxBool isThereItem = false.obs;
  RxBool isThereItemActivity = false.obs;
  RxString checkInTime = "".obs;
  RxString checkInDate = "".obs;
  RxString checkOutTime = "".obs;
  RxString checkOutDate = "".obs;
  RxInt day = 0.obs;
  RxString month = "".obs;
  RxInt workingTime = 0.obs;
  RxInt page = 1.obs;
  RxInt limit = 10.obs;

  RxInt checkInHour = 0.obs;
  RxInt checkOutHour = 0.obs;
  List rawData = [];
  List data = [];
  int id = -1;
  int scheduleId = -1;
  List<AttendanceModel> attendanceHistory = <AttendanceModel>[];
  List<ActivityRecordModel> activityRecordHistory = <ActivityRecordModel>[];
  ApiClient _apiClient = Get.put(ApiClient(Dio()));

  void getHistoryAttendance() async {
    DummyData dummy = Get.put(DummyData());
    try {
      // attendanceHistory = dummy.dummy2;

      await _apiClient
          .getHistoryAttendance('UserId==${getUserId()!}', "-CreatedAt",
              page.value, limit.value, getToken()!)
          .then((response) async {
        print(response.status);
        if (response.status == 200) {
          attendanceHistory = response.data.data.toList();
          isThereItem.value = true;
          update();
          print(attendanceHistory.length);
        } else if (response.status == 401) {
          await _apiClient.getRefreshToken(id, getToken()!).then((response) {
            saveToken(response.data);
            getHistoryAttendance();
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }

  Widget setImageView(String photoName) {
    return Image.asset(
      'assets/images/Icon/AccountBox.png',
      width: 100,
      height: 100,
    );
  }

  void currentCheckinDate(String rawDate) async {
    DateTime formatedTime = DateTime.parse(rawDate);
    List<String> formatedDate = rawDate.split(' ');
    checkInDate.value = formatedDate[0];
    DateTime parse = DateTime.parse(formatedDate[0]);
    DateTime parseInt = DateTime.parse(rawDate);

    checkInTime.value = DateFormat('HH:mm').format(formatedTime);
    checkInHour.value = parseInt.hour;

    day.value = parse.day;
    month.value = DateFormat('MMMM').format(DateTime(0, parse.month));
  }

  void currentCheckOutDate(String rawDate) async {
    DateTime formatedTime = DateTime.parse(rawDate);
    List<String> formatedDate = rawDate.split(' ');
    checkOutDate.value = DateFormat('yyyy-MM-dd').format(formatedTime);
    checkOutTime.value = DateFormat('HH:mm').format(formatedTime);
    DateTime parseInt = DateTime.parse(rawDate);
    checkOutHour.value = parseInt.hour;
    getWorkingTime();
  }

  void formatedTime(String dateTime) async {
    DateTime formatedTime = DateTime.parse(dateTime);
    dateNow.text = DateFormat('yyyy-MM-dd').format(formatedTime);
    timeNow.text = DateFormat('HH:mm').format(formatedTime);
  }

  void getWorkingTime() {
    workingTime.value = checkOutHour.value - checkInHour.value;
  }

  Future<void> getHistoryActivityRecord() async {
    // DummyData dummyData = Get.put(DummyData());
    // activityRecordHistory = dummyData.activityDummy;
    try {
      await _apiClient
          .getHistoryActivityRecord('UserId==${getUserId()!}', "-CreatedAt",
              page.value, limit.value, getToken()!)
          .then((response) async {
        print(response.status);
        if (response.status == 200) {
          print(response.status);
          activityRecordHistory = response.data.data.toList();
          isThereItemActivity.value = true;

          update();
          await Future.delayed(Duration(seconds: 3));
          print(activityRecordHistory.length);
        } else if (response.status == 401) {
          await _apiClient.getRefreshToken(id, getToken()!).then((response) {
            saveToken(response.data);
            getHistoryActivityRecord();
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
