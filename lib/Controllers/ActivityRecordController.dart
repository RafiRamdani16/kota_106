import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kota_106/Controllers/CacheManager.dart';
import 'package:kota_106/DummyData/DummyData.dart';
import 'package:kota_106/Models/ActivityRecordModel.dart';
import 'package:kota_106/Models/AttendanceModel.dart';

import 'APIService/ApiService.dart';

class ActivityRecordController extends GetxController with CacheManager {
  TextEditingController dateNow = TextEditingController();
  TextEditingController timeNow = TextEditingController();
  TextEditingController locationNow = TextEditingController();
  TextEditingController description = TextEditingController();

  RxBool isFirstLoading = false.obs;
  RxBool hasNextPage = true.obs;
  List rawData = [];
  int page = 1;
  int limit = 2;
  RxBool isLoadMoreRunning = false.obs;
  ApiClient _apiClient = Get.put(ApiClient(Dio()));
  Rx<File> tmpFile = File('').obs;
  Rx<XFile> imageFile = XFile('').obs;
  late ScrollController scrollController;
  RxString photoName = ''.obs;
  List<ActivityRecordModel> history = <ActivityRecordModel>[];
  List data = [];

  Widget setImageView() {
    if (imageFile.value.path != '') {
      tmpFile.value = File(imageFile.value.path);
      return Image.file(tmpFile.value, width: 100, height: 100);
    } else {
      return Image.asset(
        'assets/images/Icon/AccountBox.png',
        width: 100,
        height: 100,
      );
    }
  }

  void openCamera() async {
    ImagePicker _image = Get.put(ImagePicker());
    try {
      imageFile.value = (await _image.pickImage(source: ImageSource.camera))!;
      print(imageFile.value.name);
      photoName.value = imageFile.value.name;
    } catch (e) {}
  }

  void firstLoadHistory() async {
    DummyData dummyData = Get.put(DummyData());
    history = dummyData.activityDummy;
    isFirstLoading.value = true;
    // try {
    //   await _apiClient
    //       .getHistoryAttendance(
    //           'UserId==${getUserId()!}', "-CreatedAt", page, limit, getToken()!)
    //       .then((response) {
    //     print(rawData.map((e) => response.data.data).toList());
    //     history = response.data.data.toList();
    //     update();
    //     print(history.length);
    //   });
    // } catch (e) {
    //   print(e);
    //   isFirstLoading.value = false;
    // }
  }

  void loadMoreHistory() async {
    if (hasNextPage.value == true &&
        isFirstLoading.value == false &&
        isLoadMoreRunning.value == false &&
        scrollController.position.extentAfter < 10) {
      isLoadMoreRunning.value = true;
      page += 1;

      // try {
      //   await _apiClient
      //       .getHistoryAttendance('UserId==${getUserId()!}', "-CreatedAt", page,
      //           limit, getToken()!)
      //       .then((response) {
      //     data = rawData.map((e) => response.data).toList();
      //     if (data.length > 0) {
      //       history.addAll(history = response.data.data.toList());
      //     } else {
      //       hasNextPage.value = false;
      //     }
      //   });
      // } catch (e) {}
      // isLoadMoreRunning.value = false;
    }
  }
}
