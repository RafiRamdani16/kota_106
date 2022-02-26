import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kota_106/Controllers/APIService/ApiService.dart';
import 'package:kota_106/Controllers/CacheManager.dart';
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
  late List<HistoryAttendanceModel> history;
  ApiClient _apiClient = Get.put(ApiClient(Dio()));
  @override
  void onInit() {
    // token = getToken()!;
    token = '';
    page = 0.obs;
    limit = 10.obs;
    hasNextPage = true.obs;
    isFirstLoading = false.obs;
    isLoadMoreRunning = false.obs;
    firstLoadHistory();
    scrollController = new ScrollController()..addListener(loadMoreHistory);

    super.onInit();
  }

  @override
  void onClose() {
    scrollController.removeListener(loadMoreHistory);
    super.onClose();
  }

  void firstLoadHistory() async {
    isFirstLoading.value = true;
    try {
      await _apiClient
          .getHistoryAttendance(page.value, limit.value, token)
          .then((response) {
        history = rawData
            .map((e) => HistoryAttendanceModel.fromJson(response.data))
            .toList();
      });
    } catch (e) {}
    isFirstLoading.value = false;
  }

  void loadMoreHistory() async {
    if (hasNextPage.value == true &&
        isFirstLoading.value == false &&
        isLoadMoreRunning.value == false &&
        scrollController.position.extentAfter < 300) {
      isLoadMoreRunning.value = true;
      page.value += 1;

      try {
        await _apiClient
            .getHistoryAttendance(page.value, limit.value, token)
            .then((response) {
          data = rawData
              .map((e) => HistoryAttendanceModel.fromJson(response.data))
              .toList();
          if (data.length > 0) {
            history.addAll(rawData
                .map((e) => HistoryAttendanceModel.fromJson(response.data))
                .toList());
          } else {
            hasNextPage.value = false;
          }
        });
      } catch (e) {}
      isLoadMoreRunning.value = false;
    }
  }

  NetworkImage setImageView(String photoName) {
    try {
      return  NetworkImage('http:balalall/$photoName');
    } catch (e) {
      return NetworkImage('assets/images/Icon/AccountBox.png');
    }
  }
}
