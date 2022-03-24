import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Models/LoginModel.dart';
import 'APIService/ApiService.dart';
import 'Authentication.dart';
import 'CacheManager.dart';

class LoginController extends GetxController with CacheManager {
  ApiClient _apiClient = Get.put(ApiClient(Dio()));
  AuthenticationManager _authenticationManager =
      Get.put(AuthenticationManager());
   final formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  late RxBool isObsecure;

  

  @override
  void onInit() {
    isObsecure = true.obs;
    
    super.onInit();
  }


  void login(String email, String password) async {
    try {
      await _apiClient.login(email, password).then((response) async {
        var status = response.status;
        print("status1: $status");
        if (status == 200) {
          LoginModel tokenModel = response.data;
          _authenticationManager.login(
              'Bearer ${tokenModel.accessToken}',
              tokenModel.refreshToken,
              tokenModel.name,
              tokenModel.position,
              tokenModel.id,
              tokenModel.scheduleId);
          // name.value = tokenModel.name;
          // position.value = tokenModel.position;
          // userId.value = tokenModel.id;
          // scheduleId.value = tokenModel.scheduleId;
          Get.offAndToNamed('/');
        } else {
          Get.defaultDialog(
            radius: 10.0,
            contentPadding: const EdgeInsets.all(20.0),
            title: 'ALERT',
            titleStyle: TextStyle(color: Colors.red),
            middleText: 'Terjadi Kesalahan, Silahkan Ulangi Kembali',
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
      });
    } catch (e) {
      Get.defaultDialog(
        radius: 10.0,
        contentPadding: const EdgeInsets.all(20.0),
        title: 'ALERT',
        titleStyle: TextStyle(color: Colors.red),
        middleText: 'Terjadi Kesalahan, Silahkan Ulangi Kembali',
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
  }

  void securePassword() {
    isObsecure.value = true;
    update();
  }

  void unSecurePassword() {
    isObsecure.value = false;
    update();
  }
}
