import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kota_106/CacheManager.dart';
import 'package:kota_106/Profile/UserModel.dart';
import 'package:kota_106/SplashScreen.dart';
import 'package:sizer/sizer.dart';

import '../APIService/ApiService.dart';

class ProfileController extends GetxController with CacheManager {
  ApiClient _apiClient = Get.put(ApiClient(Dio()));

  TextEditingController Id = TextEditingController();
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

  TextEditingController photoName = TextEditingController();

  RxBool isLoading = true.obs;
  int employeeId = -1;
  String token = "";
  UserModel userModel = Get.put(UserModel());
  // UserModel userModel = Get.put(UserModel());

  Future<void> profile() async {
    employeeId = getEmployeeId()!;
    token = getToken()!;
    try {
      await _apiClient.getProfile(employeeId, token).then((response) async {
        print(response.status);
        if (response.status == 200) {
          userModel = response.data;
          // print(userModel.name);
          // employeeId.text = '${userModel.userId}';
          // joinDate.text = userModel.joinDate;
          // email.text = userModel.email;
          // noKTP.text = userModel.noKtp;
          // npwp.text = userModel.npwp;
          // religion.text = userModel.religion;
          // address.text = userModel.address;
          // status.text = userModel.status;
          // endDate.text = userModel.endDate;
          // phoneNumber.text = userModel.phoneNumber;
          // city.text = userModel.city;
          // dateOfBirth.text = '${userModel.dateOfBirth}';
          // name.text = userModel.name;
          // position.text = userModel.position;
          // isLoading.value = false;

          photoName.text = response.data.photoName;
          Id.text = '${response.data.userId}';
          joinDate.text = '2022-07-05';
          email.text = response.data.email;
          noKTP.text = '3273241612010001';
          npwp.text = '09.254.294.3-407.000';
          religion.text = response.data.religion;
          address.text =
              'Jalan Cisaranten Kulon, Kecamatan Arcamanik, Kota Bandung';
          status.text = response.data.status;
          endDate.text = '2030-07-05';
          phoneNumber.text = response.data.phoneNumber;
          city.text = 'Bandung';
          dateOfBirth.text = '2001-12-16';
          name.text = response.data.name;
          position.text = response.data.position;
          isLoading.value = false;

          update();
        }
      });
    } catch (e) {
      Id.text = '2';
      joinDate.text = '2022-07-05';
      email.text = 'ramdanirafi412@gmail.com';
      noKTP.text = '3273241612010001';
      npwp.text = '09.254.294.3-407.000';
      religion.text = 'Islam';
      address.text =
          'Jalan Cisaranten Kulon, Kecamatan Arcamanik, Kota Bandung';
      status.text = 'Karyawan';
      endDate.text = '2030-07-05';
      phoneNumber.text = '08987404565';
      city.text = 'Bandung';
      dateOfBirth.text = '2001-12-16';
      name.text = 'Rafi Ramdani';
      position.text = 'Junior Programmer';
      isLoading.value = false;
      print(e);
    }
    // await Future.delayed(Duration(seconds: 3));
  }

  void editProfileForm() async {
    employeeId = getEmployeeId()!;
    token = getToken()!;
    try {
      await _apiClient
          .updateProfile(
              employeeId,
              name.text,
              religion.text,
              position.text,
              userModel.currentSalary,
              status.text,
              joinDate.text,
              endDate.text,
              phoneNumber.text,
              email.text,
              address.text,
              city.text,
              userModel.noKtp,
              npwp.text,
              dateOfBirth.text,
              userModel.role,
              userModel.password,
              userModel.photoName,
              userModel.superiorId,
              token)
          .then((response) {
        if (response.status == 200) {
          Get.defaultDialog(
            radius: 10.0,
            contentPadding: const EdgeInsets.all(20.0),
            title: "SUCCESS",
            titleStyle: TextStyle(fontFamily: 'ROBOTO'),
            middleText: "Pembaruan Berhasil",
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
        } else {
          Get.defaultDialog(
            radius: 10.0,
            contentPadding: const EdgeInsets.all(20.0),
            title: "ALERT",
            titleStyle: TextStyle(fontFamily: 'ROBOTO'),
            middleText: "Pembaruan Gagal",
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
      print(e);
    }
  }

  Widget photo() {
    String photoName = getPhoto()!;
    return CircleAvatar(
        backgroundImage: NetworkImage(
            'https://e438-2001-448a-3048-620d-b4bc-9fb0-d429-7e71.ap.ngrok.io/$photoName'),
        radius: 7.h);
  }

  void logout() {
    clearStorage();
    Get.offAll(SplashScreen());
  }
}
