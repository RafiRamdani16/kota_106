import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' hide Location;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:kota_106/Controllers/AttendanceController.dart';
import 'package:kota_106/Controllers/CacheManager.dart';

import 'package:location/location.dart';

import 'APIService/ApiService.dart';

class ActivityRecordController extends GetxController with CacheManager {
  Location location = new Location();
  late LocationData _locationData;
  AttendanceController attendanceController = Get.put(AttendanceController());

  TextEditingController dateNow = TextEditingController();
  TextEditingController timeNow = TextEditingController();
  TextEditingController locationNow = TextEditingController();
  TextEditingController taskList = TextEditingController();

  ApiClient _apiClient = Get.put(ApiClient(Dio()));
  Rx<File> tmpFile = File('').obs;
  Rx<XFile> imageFile = XFile('').obs;
  int employeeId = -1;
  String token = "";
  RxString photoSelfie = ''.obs;

  Widget setImageView() {
    if (imageFile.value.path != '') {
      tmpFile.value = File(imageFile.value.path);
      photoSelfie.value =
          base64Encode(File(imageFile.value.path).readAsBytesSync()).trim();
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
      photoSelfie.value = imageFile.value.name;
    } catch (e) {}
  }

  void getLocation() async {
    _locationData = await location.getLocation();
    List<Placemark> p = await GeocodingPlatform.instance
        .placemarkFromCoordinates(
            _locationData.latitude!, _locationData.longitude!);
    Placemark place = p[0];
    locationNow.text =
        "${place.thoroughfare}-${place.locality}- ${place.postalCode}-${place.subAdministrativeArea}";
  }

  void dateTimeNow() async {
    String rawDate = "";
    WidgetsFlutterBinding.ensureInitialized();
    await initializeDateFormatting('id_ID', null).then((_) => rawDate =
        '${DateFormat("MMMM yyyy-MM-dd HH:mm", "id_ID").format(DateTime.now())}');
    List<String> formatedDate = rawDate.split(' ');
    dateNow.text = formatedDate[1];
    timeNow.text = formatedDate[2];
    update();
  }

  Future<void> activityRecordForm(String taskList, String photoSelfie) async {
    employeeId = getEmployeeId()!;
    token = getToken()!;
    try {
      await _apiClient
          .activityRecord(
              employeeId,
              locationNow.text,
              "${dateNow.text} ${timeNow.text}",
              taskList,
              'data:image/jpeg;base64,$photoSelfie',
              token)
          .then((response) async {
        if (response.status == 200) {
          message('SUCCESS', 'Activity Record Berhasil');
        } else if (response.status == 401) {
          await _apiClient.getRefreshToken(employeeId, token).then((response) {
            saveToken(response.data);
            activityRecordForm(taskList, photoSelfie);
          });
        } else {
          message('ALERT',
              'Activity Record untuk jadwal ini sudah ditambahkan sebelumnya');
        }
      });
    } catch (e) {
      message('ALERT', 'Terjadi Kesalahan');
    }
    message('SUCCESS', 'Activity Record Berhasil');
  }

  void message(String message, String content) {
    Get.defaultDialog(
      radius: 10.0,
      contentPadding: const EdgeInsets.all(20.0),
      title: message,
      titleStyle: TextStyle(fontWeight: FontWeight.bold),
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
}
