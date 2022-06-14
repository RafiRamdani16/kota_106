import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kota_106/Login/LoginScreen.dart';
import 'package:kota_106/AttendanceScreen.dart';

import '../APIService/ApiService.dart';
import '../CacheManager.dart';

class LoginController extends GetxController with CacheManager {
  ApiClient _apiClient = Get.put(ApiClient(Dio()));

  RxBool isLogged = false.obs;

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
      await _apiClient.authentication(email, password).then((response) async {
        var status = response.status;
        if (status == 200) {
          await saveToken(response.data.accessToken);
          await saveRefreshToken(response.data.refreshToken);
          await saveLoginData(response.data.name, response.data.position,
              response.data.id, response.data.superiorId, response.data.role);

          Get.offAndToNamed('/');
        } else {
          message("FAILED", "User Tidak Ditemukan");
        }
      });
      Get.toNamed('/');
    } catch (e) {
      message("ALERT", "Terjadi Kesalahan Silahkan Ulangi");
    }
    Get.toNamed('/');
  }

  void securePassword() {
    isObsecure.value = true;
    update();
  }

  void unSecurePassword() {
    isObsecure.value = false;
    update();
  }

  void checkLoginStatus() {
    final token = getToken();
    if (token != null) {
      isLogged.value = true;
    } else {
      isLogged.value = false;
    }
  }

  Widget cekLogin() {
    return Obx(() {
      return isLogged.value ? AttendanceScreen() : LoginScreen();
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

  bool cekRole() {
    String role = getRole()!;
    int superiorId = getSuperiorId()!;
    if (role == "HR") {
      return false;
    } else if (superiorId != 0) {
      return false;
    } else {
      return true;
    }
  }
}
