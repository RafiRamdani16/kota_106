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
  RxString activityRecordTime = "".obs;
  RxString activityRecordDate = "".obs;
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

  Future<void> getHistoryAttendance() async {
    // DummyData dummy = Get.put(DummyData());
    // attendanceHistory = dummy.dummy2;
    // isThereItemActivity.value = true;
    
    await _apiClient
        .getHistoryAttendance('UserId==${getUserId()!}', "-CreatedAt",
            page.value, limit.value, getToken()!)
        .then((response) async {
      print(response.status);
      if (response.status == 200) {

        attendanceHistory = response.data.data.toList();
        isThereItem.value = true;
      } else if (response.status == 401) {
        await _apiClient.getRefreshToken(id, getToken()!).then((response) {
          saveToken(response.data);
          getHistoryAttendance();
        });
      }
    });
  }

  Widget setImageView(String photoName, double width, double height) {
    return Image.network(
      'https://bbbe-2001-448a-304c-3893-1d52-5ff3-6470-a748.ngrok.io/$photoName',
      width: width,
      height: height,
    );
  }

  void changeFormatDateForActivityHistory(String rawDate) async {
    DateTime formatedDateTime = DateTime.parse(rawDate);
    activityRecordDate.value =
        DateFormat('dd MMMM yyyy').format(formatedDateTime);
    activityRecordTime.value = DateFormat('HH:mm').format(formatedDateTime);
    day.value = formatedDateTime.day;
    month.value =
        DateFormat('MMMM').format(DateTime(0, formatedDateTime.month));
  }

  void changeFormatCheckinDateForAttendanceHistory(String rawDate) async {
    DateTime formatedTime = DateTime.parse(rawDate);

    checkInDate.value = DateFormat('yyyy-MM-dd').format(formatedTime);

    checkInTime.value = DateFormat('HH:mm').format(formatedTime);
    checkInHour.value = formatedTime.hour;

    day.value = formatedTime.day;
    month.value = DateFormat('MMMM').format(DateTime(0, formatedTime.month));
  }

  void changeFormatCheckoutDateForAttendanceHistory(String rawDate) async {
    DateTime formatedTime = DateTime.parse(rawDate);

    checkOutDate.value = DateFormat('yyyy-MM-dd').format(formatedTime);
    checkOutTime.value = DateFormat('HH:mm').format(formatedTime);

    checkOutHour.value = formatedTime.hour;
    getWorkingTime();
  }

  void getWorkingTime() {
    workingTime.value = checkOutHour.value - checkInHour.value;
  }

  Future<void> getHistoryActivityRecord() async {
    DummyData dummyData = Get.put(DummyData());
    activityRecordHistory = dummyData.activityDummy;
    isThereItemActivity.value = true;
    await _apiClient
        .getHistoryActivityRecord('UserId==${getUserId()!}', "-CreatedAt",
            page.value, limit.value, getToken()!)
        .then((response) async {
      if (response.status == 200) {
        activityRecordHistory = response.data.data.toList();
        isThereItemActivity.value = true;
        update();
        await Future.delayed(Duration(seconds: 3));
      } else if (response.status == 401) {
        await _apiClient.getRefreshToken(id, getToken()!).then((response) {
          saveToken(response.data);
          getHistoryActivityRecord();
        });
      }
    });
  }
}
