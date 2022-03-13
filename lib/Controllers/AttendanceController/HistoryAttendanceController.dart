import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:kota_106/Controllers/APIService/ApiService.dart';
import 'package:kota_106/Controllers/CacheManager.dart';
import 'package:kota_106/DummyData/DummyData.dart';
import 'package:kota_106/Models/AttendanceModel.dart';
import 'package:kota_106/Models/HistoryAttendanceModel.dart';

class HistoryAttendanceController extends GetxController with CacheManager {
  TextEditingController locationCheckin2 = TextEditingController();
  TextEditingController locationCheckout = TextEditingController();
  TextEditingController doneList = TextEditingController();

  late RxString checkInTime = "".obs;
  late RxString checkInDate = "".obs;
  late RxString checkOutTime = "".obs;
  late RxString checkOutDate = "".obs;
  late RxInt day = 0.obs;
  late RxString month = "".obs;
  late RxInt workingTime = 0.obs;
  late RxInt page = 1.obs;
  late RxInt limit = 10.obs;
  late RxBool hasNextPage = true.obs;
  late RxBool isFirstLoading = false.obs;
  late RxBool isLoadMoreRunning = false.obs;
  late ScrollController scrollController = new ScrollController()
    ..addListener(loadMoreHistory);

  late RxInt checkInHour = 0.obs;
  late RxInt checkOutHour = 0.obs;
  // late RxList post;
  late String token = "";
  late List rawData = [];
  late List data = [];
  late int id = -1;
  late int scheduleId = -1;
  late List<AttendanceModel> history = <AttendanceModel>[];
  ApiClient _apiClient = Get.put(ApiClient(Dio()));


  void firstLoadHistory() async {
    DummyData dummy = Get.put(DummyData());
    try {
      history = dummy.dummy2;
      isFirstLoading.value = true;
      // await _apiClient
      //     .getHistoryAttendance('UserId==${getUserId()!}', "-CreatedAt",
      //         page.value, limit.value, getToken()!)
      //     .then((response) {
      //   isFirstLoading.value = true;
      //   print(response.status);
      //   print(response.data.data.toList().toString());
      //   HistoryAttendanceModel public = response.data;
      //   print("public$public");
      //   print(rawData.map((e) => response.data.data).toList());
      //   history = response.data.data.toList();
      //   update();
      //   print(history.length);
      // });
    } catch (e) {
      print(e);
      isFirstLoading.value = false;
    }
  }

  void loadMoreHistory() async {
    scheduleId = getScheduleId()!;
    if (hasNextPage.value == true &&
        isFirstLoading.value == false &&
        isLoadMoreRunning.value == false &&
        scrollController.position.extentAfter < 10) {
      isLoadMoreRunning.value = true;
      page.value += 1;

      try {
        await _apiClient
            .getHistoryAttendance('UserId==${getUserId()!}', "-CreatedAt",
                page.value, limit.value, getToken()!)
            .then((response) {
          data = rawData.map((e) => response.data).toList();
          if (data.length > 0) {
            history.addAll(history = response.data.data.toList());
          } else {
            hasNextPage.value = false;
          }
        });
      } catch (e) {}
      isLoadMoreRunning.value = false;
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
    // String data =
    //     ('${DateFormat("MMMM yyyy-MM-dd hh:mm", "id_ID").format(parse)}');
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
}
