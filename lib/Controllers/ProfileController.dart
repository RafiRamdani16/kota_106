import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kota_106/Controllers/CacheManager.dart';
import 'package:kota_106/Models/UserModel.dart';

import 'APIService/ApiService.dart';

class ProfileController extends GetxController with CacheManager {
  ApiClient _apiClient = Get.put(ApiClient(Dio()));

  TextEditingController employeeId = TextEditingController();
  TextEditingController joinDate = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController noKTP = TextEditingController();
  TextEditingController npwp = TextEditingController();
  TextEditingController religion = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController status = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController position = TextEditingController();

  RxBool isLoading = true.obs;

  UserModel userModel = Get.put(UserModel());

  void getProfile() async {
    try {
      await _apiClient.getProfile(getUserId()!, getToken()!).then((response) {
        if (response.status == 200) {
          userModel = response.data;
          employeeId.text = '${userModel.id}';
          joinDate.text = userModel.joinDate;
          email.text = userModel.email;
          noKTP.text = userModel.noKtp;
          npwp.text = userModel.npwp;
          religion.text = userModel.religion;
          address.text = userModel.address;
          status.text = userModel.status;
          endDate.text = userModel.endDate;
          phoneNumber.text = userModel.phoneNumber;
          city.text = userModel.city;
          dateOfBirth.text = '${userModel.dateOfBirth}';
          name.text = userModel.name;
          position.text = userModel.position;
        }
      });
      isLoading.value = false;
    } catch (e) {
      isLoading.value = true;
    }
    await Future.delayed(Duration(seconds: 3));
  }

  void updateProfile() {}
}
