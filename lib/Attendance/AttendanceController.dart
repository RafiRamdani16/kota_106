import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' hide Location;

import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../APIService/ApiService.dart';
import '../CacheManager.dart';


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
  var statusTimeCheckIn = false.obs;
  TextEditingController clocation = TextEditingController();
  TextEditingController cDate = TextEditingController();
  TextEditingController cTime = TextEditingController();
  TextEditingController taskList = TextEditingController();

  RxString currentAddress = "".obs;
  RxBool _permission = false.obs;
  RxString date = "".obs;
  RxString time = "".obs;
  Rx<File> tmpFile = File('').obs;
  Rx<XFile> imageFile = XFile('').obs;
  RxString photoName = "".obs;
  String token = "";
  int employeeId = -1;
  final formkey = Get.put(GlobalKey<FormState>());

  @override
  onInit() {
    getLocationPermission();
    initializeDateFormatting();
    super.onInit();
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
      statusTimeCheckIn.value = false;
      return false;
    } else {
      return true;
    }
  }

  bool checkOutStatus() {
    var now = DateFormat("yyyy-MM-dd", "id_ID").format(DateTime.now());
    var checkOutTime = getCheckoutTime();
    var checkInTime = getCheckinTime();
    var formatedCheckoutTime = "";

    if (checkOutTime == null) {
      if (checkInTime == null) {
        return false;
      } else {
        formatedCheckoutTime = DateFormat("yyyy-MM-dd", "id_ID")
            .format(DateTime.now().subtract(Duration(days: 1)));
        return true;
      }
    } else {
      formatedCheckoutTime = DateFormat("yyyy-MM-dd", "id_ID")
          .format(DateTime.parse(checkOutTime));
    }
    if (now == checkInTime && now != formatedCheckoutTime) {
      return true;
    } else {
      return false;
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

  void getLocation() async {
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
      imageFile.value = (await _image.pickImage(
          source: ImageSource.camera,
          imageQuality: 25,
          maxHeight: 480,
          maxWidth: 640))!;
      photoName.value = imageFile.value.name;
    } catch (e) {
      // return 'Terjadi Kesalahan';
    }
  }

  void openGallery() async {
    ImagePicker _image = Get.put(ImagePicker());
    try {
      imageFile.value = (await _image.pickImage(
          source: ImageSource.gallery,
          imageQuality: 25,
          maxHeight: 480,
          maxWidth: 640))!;
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
      return Image.asset(
        'assets/images/Icon/AccountBox.png',
        width: 100,
        height: 100,
      );
    }
  }

  Future<void> getDateTimeNow() async {
    date.value = DateFormat("yyyy-MM-dd", "id_ID").format(DateTime.now());
    time.value = DateFormat("HH:mm", "id_ID").format(DateTime.now());

    cDate.text = date.value;
    cTime.text = time.value;
  }

  Widget showAlert() {
    return Container(
      padding: EdgeInsets.only(top: Get.height / 4),
      child: Text(
        'Tidak ada jadwal untuk saat ini',
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget scanQRPage(String typeScan) {
    GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
    return Container(
      height: Get.height,
      child: QRView(
          key: qrKey,
          overlay: QrScannerOverlayShape(
            borderColor: Colors.white,
            borderRadius: 15,
            borderLength: 30,
            borderWidth: 10,
            cutOutSize: 300,
          ),
          onQRViewCreated: (controller) {
            controller.scannedDataStream.listen((kodeQRCode) {
              print(kodeQRCode.code);
              controller.pauseCamera();
              if (typeScan == 'check-in') {
                checkQRCode(kodeQRCode.code!, "Checkin");
                print("status QRCode: ${statusQRCode.value}");
                Future.delayed(Duration(seconds: 1));
                if (statusCheckinScan.value == true) {
                  controller.stopCamera();
                } else {
                  controller.resumeCamera();
                }
              } else {
                checkQRCode(kodeQRCode.code!, "Checkout");
                print("status QRCode: ${statusQRCode.value}");
                Future.delayed(Duration(seconds: 1));
                if (statusCheckoutScan.value == true) {
                  controller.stopCamera();
                } else {
                  controller.resumeCamera();
                }
              }
            });
          }),
    );
  }

  void checkQRCode(String kodeQRCode, String typeQRCode) {
    token = getToken()!;
    print(kodeQRCode);
    print(typeQRCode);
    try {
      _apiClient.checkQRCode(typeQRCode, kodeQRCode, token).then((response) {
        if (response.status == 200) {
          statusQRCode.value = true;
          if (typeQRCode == "Checkin") {
            statusCheckinScan.value = true;
          } else {
            statusCheckoutScan.value = true;
          }
        } else {
          statusQRCode.value = false;
          if (typeQRCode == "Checkin") {
            statusCheckinScan.value = false;
          } else {
            statusCheckoutScan.value = false;
          }
          message("FAILED", "Kode QR Code Tidak Valid");
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void checkTimeCheckIn() async {
    String checkInDate = "${DateTime.now()}";
    token = getToken()!;
    print("checkIndate: $checkInDate");
    try {
      await _apiClient.checkStatusCheckin(checkInDate, token).then((response) {
        if (response.status == 200) {
          statusTimeCheckIn.value = true;
        } else if (response.status == 401) {
          statusTimeCheckIn.value = false;
        }
      });
    } catch (e) {
      print(e);
    }
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

  void checkInOnlineForm(String taskList, String photoSelfie) async {
    String checkInTime = '${cDate.text} ${cTime.text}';

    employeeId = getEmployeeId()!;
    token = getToken()!;
    print("token = $token");
    print("image: $photoSelfie");
    try {
      await _apiClient
          .checkinOnline(
              employeeId,
              clocation.text,
              'data:image/jpeg;base64,$photoSelfie',
              checkInTime,
              taskList,
              token)
          .then((response) async {
        print(response.status);
        if (response.status == 200) {
          removeCheckinTime();
          saveCheckInTime(checkInTime);
          message('SUCCESS', 'CHECK-IN BERHASIL');
          update();
          this.taskList.text = "";
          clocation.text = "";
        } else if (response.status == 401) {
          await _apiClient
              .getRefreshToken(employeeId, getToken()!)
              .then((response) {
            removeToken();
            saveToken(response.data);
            checkInOnlineForm(taskList, photoSelfie);
          });
        } else if (response.status == 409) {
          message('ALERT',
              'Tidak dapat melakukan check-in lebih dari satu kali dalam sehari');
        } else {
          message('ALERT', 'CHECK-IN GAGAL');
        }
      });
    } catch (e) {
      print("error $e");
    }
  }

  void checkOutOnline(String taskList) async {
    String checkOutTime = '${cDate.text} ${cTime.text}';
    employeeId = getEmployeeId()!;
    token = getToken()!;
    await _apiClient
        .checkoutOnline(
            employeeId, clocation.text, checkOutTime, taskList, token)
        .then((response) async {
      if (response.status == 200) {
        removeCheckoutTime();
        saveCheckOutTime(checkOutTime);
        message('SUCCESS', 'CHECK-OUT BERHASIL');
        update();
        this.taskList.text = "";
        clocation.text = "";
      } else if (response.status == 401) {
        await _apiClient.getRefreshToken(employeeId, token).then((response) {
          saveToken(response.data);
          checkOutOnline(taskList);
        });
      } else {
        message('ALERT', 'CHECK-OUT GAGAL');
      }
    });
  }

  void checkInOfflineForm(String taskList) async {
    String checkInTime = '${cDate.text} ${cTime.text}';
    employeeId = getEmployeeId()!;
    token = getToken()!;
    await _apiClient
        .checkinOffline(
            employeeId, clocation.text, checkInTime, taskList, token)
        .then((response) async {
      if (response.status == 200) {
        removeCheckinTime();
        saveCheckInTime(checkInTime);
        message('SUCCESS', 'CHECK-IN BERHASIL');
        update();
        this.taskList.text = "";
        clocation.text = "";
      } else if (response.status == 401) {
        await _apiClient
            .getRefreshToken(employeeId, getToken()!)
            .then((response) {
          saveToken(response.data);
          checkInOfflineForm(taskList);
        });
      } else {
        message('ALERT', 'CHECK-IN GAGAL');
      }
    });
  
  }

  void checkOutOffline(String taskList) async {
    String checkOutTime = '${cDate.text} ${cTime.text}';
    employeeId = getEmployeeId()!;
    token = getToken()!;
    await _apiClient
        .checkoutOffline(
            employeeId, clocation.text, checkOutTime, taskList, token)
        .then((response) async {
      if (response.status == 200) {
        removeCheckoutTime();
        saveCheckOutTime(checkOutTime);
        message('SUCCESS', 'CHECK-OUT BERHASIL');
        update();
        this.taskList.text = "";
        clocation.text = "";
      } else if (response.status == 401) {
        await _apiClient.getRefreshToken(employeeId, token).then((response) {
          clearStorage();
          saveToken(response.data);
          checkOutOffline(taskList);
        });
      } else {
        message('ALERT', 'CHECK-OUT GAGAL');
      }
    });
  
  }
}
