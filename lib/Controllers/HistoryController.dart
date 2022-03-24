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

  RxBool isThereItem = false.obs;

  RxString checkInTime = "".obs;
  RxString checkInDate = "".obs;
  RxString checkOutTime = "".obs;
  RxString checkOutDate = "".obs;
  RxInt day = 0.obs;
  RxString month = "".obs;
  RxInt workingTime = 0.obs;
  RxInt page = 1.obs;
  RxInt limit = 10.obs;
  RxBool hasNextPage = true.obs;
  RxBool isFirstLoading = false.obs;
  RxBool isLoadMoreRunning = false.obs;

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
      attendanceHistory = dummy.dummy2;
      isThereItem.value = true;
      await _apiClient
          .getHistoryAttendance('UserId==${getUserId()!}', "-CreatedAt",
              page.value, limit.value, getToken()!)
          .then((response) {
        isFirstLoading.value = true;
        print(response.status);
        print(response.data.data.toList().toString());
        attendanceHistory = response.data.data.toList();
        update();
        print(attendanceHistory.length);
      });
    } catch (e) {
      print(e);
      isFirstLoading.value = false;
    }
  }

  NetworkImage setImageView(String photoName) {
    return NetworkImage('assets/images/Icon/AccountBox.png');
    // try {
    //   return NetworkImage('http:balalall/$photoName');
    // } catch (e) {

    // }
  }

  void currentCheckinDate(String rawDate) async {
    List<String> formatedDate = rawDate.split(' ');
    checkInDate.value = formatedDate[0];
    DateTime parse = DateTime.parse(formatedDate[0]);
    DateTime parseInt = DateTime.parse(rawDate);

    checkInTime.value = formatedDate[1];
    checkInHour.value = parseInt.hour;
   
    day.value = parse.day;
    month.value = DateFormat('MMMM').format(DateTime(0, parse.month));
  }

  void currentCheckOutDate(String rawDate) async {
    List<String> formatedDate = rawDate.split(' ');
    checkOutDate.value = formatedDate[0];
    checkOutTime.value = formatedDate[1];
    DateTime parseInt = DateTime.parse(rawDate);
    checkOutHour.value = parseInt.hour;
    getWorkingTime();
  }

  void getWorkingTime() {
    workingTime.value = checkOutHour.value - checkInHour.value;
  }

  void getHistoryActivityRecord() async {
    try {
      await _apiClient
          .getHistoryActivityRecord('UserId==${getUserId()!}', "-CreatedAt",
              page.value, limit.value, getToken()!)
          .then((response) {
        if (response.status == 200) {
          activityRecordHistory = response.data.data.toList();
        }
      });
    } catch (e) {}
  }
}
