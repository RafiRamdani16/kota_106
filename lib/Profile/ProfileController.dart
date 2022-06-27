import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:kota_106/CacheManager.dart';
import 'package:kota_106/Profile/ReligionModel.dart';
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
  TextEditingController editPhotoName = TextEditingController();
  RxString photoName = "".obs;

  RxBool isLoading = true.obs;
  int employeeId = -1;
  String token = "";
  UserModel userModel = Get.put(UserModel());
  List<ReligionModel> religionItems = <ReligionModel>[];

  RxString selectedReligion = "Islam".obs;
  RxString selectedGender = "Pria".obs;
  RxInt selectedReligionId = 0.obs;
  Rx<File> tmpFile = File('').obs;
  Rx<XFile> imageFile = XFile('').obs;
  ImagePicker _image = Get.put(ImagePicker());

  Future<void> profile() async {
    employeeId = getEmployeeId()!;
    token = getToken()!;
    try {
      await _apiClient.getProfile(employeeId, token).then((response) async {
        print(response.status);
        if (response.status == 200) {
          userModel = response.data;
          Id.text = "${getEmployeeId()!}";
          email.text = userModel.email;
          noKTP.text = userModel.noKtp;
          npwp.text = userModel.npwp;
          religion.text = userModel.religion;
          address.text = userModel.address;
          status.text = userModel.status;
          phoneNumber.text = userModel.phoneNumber;
          city.text = userModel.city;
          name.text = userModel.name;
          position.text = userModel.position;
          isLoading.value = false;
          selectedGender.value = userModel.gender;
          selectedReligion.value = userModel.religion;
          endDate.text = DateFormat('yyyy-MM-dd')
              .format(DateTime.parse(userModel.endDate));
          if (endDate.text == '0001-01-01') {
            endDate.text = "";
          }
          dateOfBirth.text = DateFormat('yyyy-MM-dd')
              .format(DateTime.parse(userModel.dateOfBirth));
          joinDate.text = DateFormat('yyyy-MM-dd')
              .format(DateTime.parse(userModel.joinDate));
          removeName();
          removePosition();
          removeRole();
          removeSuperiorId();
          removePhoto();
          setName(userModel.name);
          setPosition(userModel.position);
          setRole(userModel.role);
          setSuperiorId(userModel.superiorId);
          setPhoto(userModel.photoName);
          imageFile.value = XFile('');
        }
      });
    } catch (e) {
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
              userModel.superiorId,
              name.text,
              selectedReligion.value,
              userModel.position,
              userModel.gender,
              status.text,
              userModel.joinDate,
              userModel.endDate,
              phoneNumber.text,
              email.text,
              address.text,
              city.text,
              noKTP.text,
              npwp.text,
              dateOfBirth.text,
              userModel.role,
              "",
              photoName.value,
              token)
          .then((response) {
        print("response${response.status}");
        if (response.status == 200) {
          removeName();
          setName(name.text);
          Get.defaultDialog(
            radius: 10.0,
            contentPadding: const EdgeInsets.all(20.0),
            title: "SUCCESS",
            titleStyle: TextStyle(fontFamily: 'ROBOTO'),
            middleText: "Pembaruan Data Diri Berhasil",
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
            'https://c736-2001-448a-3045-5919-813a-d9cd-df47-a5eb.ap.ngrok.io/$photoName'),
        radius: 7.h);
  }

  void logout() {
    clearStorage();
    Get.offAll(SplashScreen());
  }

  void setPhotoProfile() {
    if (imageFile.value.path != '') {
      tmpFile.value = File(imageFile.value.path);
      photoName.value =
          "data:image/jpeg;base64,${base64Encode(File(imageFile.value.path).readAsBytesSync()).trim()}";
      editPhotoName.text = imageFile.value.name;
      print(imageFile.value.name);
    } else {
      editPhotoName.text = userModel.photoName;
      print(imageFile.value.name);
    }
  }

  void uploadButton(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Foto"),
            content: Text("Upload Foto From..."),
            actions: [
              TextButton(
                  onPressed: () {
                    openCamera();
                  },
                  child: Text(
                    "Camera",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )),
              TextButton(
                  onPressed: () {
                    openGallery();
                  },
                  child: Text(
                    "Gallery",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )),
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ))
            ],
          );
        });
  }

  void openCamera() async {
    try {
      imageFile.value = (await _image.pickImage(
          source: ImageSource.camera, imageQuality: 25))!;
      setPhotoProfile();
    } catch (e) {
      // return 'Terjadi Kesalahan';
    }
  }

  Future<void> openGallery() async {
    try {
      imageFile.value = (await _image.pickImage(
          source: ImageSource.gallery, imageQuality: 25))!;
      setPhotoProfile();
    } catch (e) {
      // return 'Terjadi Kesalahan';
    }
  }
}
