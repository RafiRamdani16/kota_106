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
  late final formkey;
  late TextEditingController email;
  late TextEditingController password;
  late RxBool isObsecure;

  late RxString name;
  late RxString position;
  late RxInt userId;
  late RxInt scheduleId;
  @override
  void onInit() {
    isObsecure = true.obs;
    name = 'Rafi'.obs;
    position = 'Proggrammer'.obs;
    userId = 0.obs;
    scheduleId = 0.obs;
    email = TextEditingController();
    password = TextEditingController();
    formkey = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();

    super.onClose();
  }

  void login(String email, String password) async {
    try {
      await _apiClient.login(email, password).then((response) async {
        var status = response.status;
        print(status);
        if (status == 200) {
          LoginModel tokenModel = LoginModel.fromJson(response.data);
          _authenticationManager.login(
              tokenModel.accessToken,
              tokenModel.refreshToken,
              tokenModel.name,
              tokenModel.position,
              tokenModel.id,
              tokenModel.scheduleId);

          name.value = tokenModel.name;
          position.value = tokenModel.position;
          // userId.value = tokenModel.id;
          // scheduleId.value = tokenModel.scheduleId;
          Get.offAndToNamed('/');
        } else {
          print('Status: ${response.status}');
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
