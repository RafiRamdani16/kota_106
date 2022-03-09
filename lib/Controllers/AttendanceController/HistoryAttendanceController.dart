import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kota_106/Controllers/APIService/ApiService.dart';
import 'package:kota_106/Controllers/CacheManager.dart';
import 'package:kota_106/Models/AttendanceModel.dart';
import 'package:kota_106/Models/HistoryAttendanceModel.dart';

class HistoryAttendanceController extends GetxController with CacheManager {
  late RxInt page;
  late RxInt limit;
  late RxBool hasNextPage;
  late RxBool isFirstLoading;
  late RxBool isLoadMoreRunning;
  late ScrollController scrollController;
  // late RxList post;
  late String token;
  late List rawData;
  late List data;
  late int id;
  late int scheduleId;
  late List<AttendanceModel> history;
  ApiClient _apiClient = Get.put(ApiClient(Dio()));
  @override
  void onInit() {
    // token = '';
    history = <AttendanceModel>[];
    rawData = [];
    page = 1.obs;
    limit = 2.obs;
    hasNextPage = true.obs;
    isFirstLoading = false.obs;
    isLoadMoreRunning = false.obs;
    // firstLoadHistory();
    scrollController = new ScrollController()..addListener(loadMoreHistory);

    super.onInit();
  }

  @override
  void onClose() {
    scrollController.removeListener(loadMoreHistory);
    super.onClose();
  }

  void firstLoadHistory() async {
    token = getToken()!;
    id = getUserId()!;
    scheduleId = getScheduleId()!;
    isFirstLoading.value = true;
    try {
      await _apiClient
          .getHistoryAttendance('UserId==$id', page.value, limit.value, token)
          .then((response) {
        print(response.status);
        print(response.data.data.toList().toString());
        HistoryAttendanceModel public = response.data;
        print("public$public");
        print(rawData.map((e) => response.data.data).toList());
        history = response.data.data.toList();

        print(history.length);
      });
    } catch (e) {
      print(e);
      isFirstLoading.value = false;
    }
  }

  void loadMoreHistory() async {
    token = getToken()!;
    id = getUserId()!;
    scheduleId = getScheduleId()!;
    if (hasNextPage.value == true &&
        isFirstLoading.value == false &&
        isLoadMoreRunning.value == false &&
        scrollController.position.extentAfter < 300) {
      isLoadMoreRunning.value = true;
      page.value += 1;

      try {
        await _apiClient
            .getHistoryAttendance('UserId==$id', page.value, limit.value, token)
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
}
