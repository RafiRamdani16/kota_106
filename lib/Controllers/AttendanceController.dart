import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:kota_106/Models/ScheduleModel.dart';
import 'package:location/location.dart';

import 'package:geocoding/geocoding.dart' hide Location;

import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'APIService/ApiService.dart';
import 'CacheManager.dart';

class AttendanceController extends GetxController with CacheManager {
  QRViewController? controller;
  ApiClient _apiClient = Get.put(ApiClient(Dio()));
  Barcode? result;
  RxBool getData = false.obs;
  var statusCheckinScan = false.obs;
  var statusCheckoutScan = false.obs;

  var checkinScheduleDateTime = "".obs;

  Location location = new Location();
  late LocationData _locationData;
  var statusQRCode = false.obs;
  TextEditingController clocation = TextEditingController();
  TextEditingController cDate = TextEditingController();
  TextEditingController cTime = TextEditingController();
  TextEditingController note = TextEditingController();

  RxString currentAddress = "".obs;
  RxBool _permission = false.obs;
  RxString date = "".obs;
  RxString time = "".obs;
  // RxString nameMonth = "".obs;
  Rx<File> tmpFile = File('').obs;
  Rx<XFile> imageFile = XFile('').obs;
  //  Rx<bool> event;
  RxString photoName = "".obs;
  String token = "";
  int id = -1;
  int scheduleId = -1;
  final formkey = Get.put(GlobalKey<FormState>());

  @override
  onInit() {
    getLocationPermission();
    super.onInit();
  }

  void getSchedule() async {
    await _apiClient.getSchedule(getUserId()!, getToken()!).then((response) {
      if (response.status == 200) {
        ScheduleModel scheduleModel = Get.put(ScheduleModel());
        scheduleModel = response.data;
        checkinScheduleDateTime.value = scheduleModel.startCheckinAt;
      }
    });
  }

  bool checkSchedule() {
    checkinScheduleDateTime.value = "${DateTime.now()}";
    DateTime schedule = DateTime.parse(checkinScheduleDateTime.value);
    var now = DateTime.now();
    if (now.isAfter(schedule.subtract(Duration(minutes: 30)))) {
      return true;
    } else {
      return false;
    }
  }

  bool checkInStatus() {
    var now = DateFormat("yyyy-MM-dd", "id_ID").format(DateTime.now());
    var checkInTime = getCheckinTime();
    var formatedCheckinTime = "";
    if (checkInTime == null) {
      formatedCheckinTime = DateFormat("yyyy-MM-dd", "id_ID")
          .format(DateTime.now().subtract(Duration(days: 1)));
    } else {
      formatedCheckinTime =
          DateFormat("yyyy-MM-dd", "id_ID").format(DateTime.parse(checkInTime));
    }

    if (now == formatedCheckinTime) {
      return false;
    } else {
      return true;
    }
  }

  bool checkOutStatus() {
    var now = DateFormat("yyyy-MM-dd", "id_ID").format(DateTime.now());
    var checkOutTime = getCheckoutTime();
    var formatedCheckoutTime = "";
    if (checkOutTime == null) {
      formatedCheckoutTime = DateFormat("yyyy-MM-dd", "id_ID")
          .format(DateTime.now().subtract(Duration(days: 1)));
    } else {
      formatedCheckoutTime = DateFormat("yyyy-MM-dd", "id_ID")
          .format(DateTime.parse(checkOutTime));
    }
    if (now == formatedCheckoutTime) {
      return false;
    } else {
      return true;
    }
  }

  Future<bool> getLocationPermission() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return false;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return false;
      }
    }
    _permission.value = true;
    return true;
  }

  void getCurrentLocation() async {
    if (_permission.value) {
      getData.value = true;
      _locationData = await location.getLocation();
      List<Placemark> p = await GeocodingPlatform.instance
          .placemarkFromCoordinates(
              _locationData.latitude!, _locationData.longitude!);
      Placemark place = p[0];
      currentAddress.value =
          "${place.thoroughfare}-${place.locality}- ${place.postalCode}-${place.subAdministrativeArea}";
      clocation.text = currentAddress.value;
    }
    update();
  }

  void openCamera() async {
    ImagePicker _image = Get.put(ImagePicker());
    try {
      imageFile.value = (await _image.pickImage(source: ImageSource.camera))!;
      print(imageFile.value.name);
      photoName.value = imageFile.value.name;
    } catch (e) {
      // return 'Terjadi Kesalahan';
    }
  }

  Widget setImageView() {
    if (imageFile.value.path != '') {
      tmpFile.value = File(imageFile.value.path);
      photoName.value =
          base64Encode(File(imageFile.value.path).readAsBytesSync()).trim();
      return Image.file(tmpFile.value, width: 100, height: 100);
    } else {
      // photoName.value = 'assets/images/Icon/AccountBox.png';
      return Image.asset(
        'assets/images/Icon/AccountBox.png',
        width: 100,
        height: 100,
      );
    }
  }

  Future<void> currentDate() async {
    getData.value = true;

    date.value = DateFormat("yyyy-MM-dd", "id_ID").format(DateTime.now());
    time.value = DateFormat("HH:mm", "id_ID").format(DateTime.now());

    cDate.text = date.value;
    cTime.text = time.value;
    update();
  }

  Widget showAlert() {
    return Container(
      child: Center(
          child: Text(
        'Tidak ada jadwal untuk saat ini',
        style: TextStyle(fontFamily: 'ROBOTO', fontSize: 16),
      )),
    );
  }

  Widget scanQRPage(GlobalKey qrKey, String typeScan) {
    return QRView(
        key: qrKey,
        overlay: QrScannerOverlayShape(
          borderColor: Colors.white,
          borderRadius: 15,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: 300,
        ),
        onQRViewCreated: (controller) {
          controller.scannedDataStream.listen((scanData) {
            controller.pauseCamera();
            if (typeScan == 'check-in') {
              checkQRCode(scanData.code!);
              // ignore: unrelated_type_equality_checks
              if (statusQRCode.value == false) {
                statusCheckinScan.value = false;
                Get.back();
              } else {
                statusCheckinScan.value = true;
              }
            } else {
              checkQRCode(scanData.code!);
              // ignore: unrelated_type_equality_checks
              if (statusQRCode.value == false) {
                statusCheckoutScan.value = false;
                Get.back();
              } else {
                statusCheckoutScan.value = true;
              }
            }
          });
        });
  }

  void checkQRCode(String dataQRCode) async {
    token = getToken()!;
    await _apiClient.checkQRCodeO(dataQRCode, token).then((response) {
      if (response.status == 200) {
        statusQRCode.value = true;
      } else {
        statusQRCode.value = false;
      }
    });
  }

  void dialog(String message, String content) {
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

  void checkInOnline(
      String location, String checkInTime, String description) async {
    id = getUserId()!;
    scheduleId = getScheduleId()!;
    token = getToken()!;
    await _apiClient
        .checkinOnline(
            id,
            scheduleId,
            location,
            'data:image/jpeg;base64,${photoName.value}',
            checkInTime,
            description,
            token)
        .then((response) async {
      print(response.status);
      if (response.status == 200) {
        removeCheckinTime();
        saveCheckInTime(checkInTime);
        dialog('SUCCESS', 'CHECK-IN BERHASIL');
      } else if (response.status == 401) {
        await _apiClient.getRefreshToken(id, getToken()!).then((response) {
          removeToken();
          saveToken(response.data);
          checkInOnline(location, checkInTime, description);
        });
      } else {
        dialog('ALERT', 'CHECK-IN GAGAL');
      }
    });
  }

  void checkOutOnline(
      String location, String checkOutTime, String description) async {
    await _apiClient
        .checkoutOnline(getUserId()!, getScheduleId()!, location, checkOutTime,
            description, getToken()!)
        .then((response) async {
      if (response.status == 200) {
        removeCheckoutTime();
        saveCheckOutTime(checkOutTime);
        dialog('SUCCESS', 'CHECK-OUT BERHASIL');
      } else if (response.status == 401) {
        await _apiClient.getRefreshToken(id, getToken()!).then((response) {
          saveToken(response.data);
          checkOutOnline(location, checkOutTime, description);
        });
      } else {
        dialog('ALERT', 'CHECK-OUT GAGAL');
      }
    });
  }

  void checkInOffline(
      String location, String checkinTime, String description) async {
    await _apiClient
        .checkinOffline(getUserId()!, getScheduleId()!, location, checkinTime,
            description, getToken()!)
        .then((response) async {
      if (response.status == 200) {
        removeCheckinTime();
        saveCheckInTime(checkinTime);
        dialog('SUCCESS', 'CHECK-IN BERHASIL');
      } else if (response.status == 401) {
        await _apiClient.getRefreshToken(id, getToken()!).then((response) {
          saveToken(response.data);
          checkInOffline(location, checkinTime, description);
        });
      } else {
        dialog('ALERT', 'CHECK-IN GAGAL');
      }
    });
  }

  void checkOutOffline(
      String location, String checkoutTime, String description) async {
    id = getUserId()!;
    scheduleId = getScheduleId()!;
    token = getToken()!;
    await _apiClient
        .checkoutOffline(getUserId()!, getScheduleId()!, location, checkoutTime,
            description, getToken()!)
        .then((response) async {
      if (response.status == 200) {
        removeCheckoutTime();
        saveCheckOutTime(checkoutTime);
        dialog('SUCCESS', 'CHECK-OUT BERHASIL');
      } else if (response.status == 401) {
        await _apiClient.getRefreshToken(id, getToken()!).then((response) {
          clearStorage();
          saveToken(response.data);
          checkOutOffline(location, checkoutTime, description);
        });
      } else {
        dialog('ALERT', 'CHECK-OUT GAGAL');
      }
    });
  }
}