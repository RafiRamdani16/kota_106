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
import 'APIService/ApiService.dart';
import 'CacheManager.dart';

class AttendanceController extends GetxController with CacheManager {
  QRViewController? controller;
  ApiClient _apiClient = Get.put(ApiClient(Dio()));
  Barcode? result;
  RxBool getData = false.obs;
  var statusScan = false.obs;
  RxBool statusCheckinOnline = false.obs;
  RxBool statusCheckoutOnline = false.obs;
  RxBool statusCheckinOffline = false.obs;
  RxBool statusCheckoutOffline = false.obs;
  Location location = new Location();
  late LocationData _locationData;

  TextEditingController clocation = TextEditingController();
  TextEditingController cDateTime = TextEditingController();
  TextEditingController cTime = TextEditingController();
  TextEditingController note = TextEditingController();

  RxString currentAddress = "".obs;
  RxBool _permission = false.obs;
  RxString date = "".obs;
  RxString time = "".obs;
  RxString nameMonth = "".obs;
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
    getPermission();
    super.onInit();
  }

  Future<bool> getPermission() async {
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

  void getAddress() async {
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
      print(photoName.value);
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
    String rawDate = "";
    WidgetsFlutterBinding.ensureInitialized();
    await initializeDateFormatting('id_ID', null).then((_) => rawDate =
        '${DateFormat("MMMM yyyy-MM-dd HH:mm", "id_ID").format(DateTime.now())}');
    List<String> formatedDate = rawDate.split(' ');
    nameMonth.value = formatedDate[0];
    date.value = formatedDate[1];
    time.value = formatedDate[2];
    cDateTime.text = date.value;
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

  Widget scanQRPage(GlobalKey qrKey, BuildContext context) {
    return QRView(
        key: qrKey,
        onQRViewCreated: (controller) {
          controller.scannedDataStream.listen((scanData) async {
            statusScan.value = true;
            time.value = scanData.code!;
            controller.pauseCamera();
            Get.offNamed('/officeCheckIn');
          });
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

  void getSchedule() async {
    await _apiClient.getSchedule(getUserId()!, getToken()!).then((response) {
      if (response.status == 200) {}
    });
  }

  void pencatatanKehadiranAwalDiLuarKantor(
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
        statusCheckinOnline.value = true;
        statusCheckinOffline.value = true;
        dialog('SUCCESS', 'CHECK-IN BERHASIL');
      } else if (response.status == 401) {
        await _apiClient.getRefreshToken(id, getToken()!).then((response) {
          saveToken(response.data);
          pencatatanKehadiranAwalDiLuarKantor(location, checkInTime, description);
        });
      } else {
        dialog('ALERT', 'CHECK-IN GAGAL');
      }
    });
  }

  void pencatatanKehadiranAkhirDiLuarKantor(
      String location, String checkOutTime, String description) async {
    id = getUserId()!;
    scheduleId = getScheduleId()!;
    token = getToken()!;
    await _apiClient
        .checkoutOnline(
            id, scheduleId, location, checkOutTime, description, token)
        .then((response) async {
      if (response.status == 200) {
        statusCheckoutOnline.value = true;
        statusCheckoutOffline.value = true;
        dialog('SUCCESS', 'CHECK-OUT BERHASIL');
      } else if (response.status == 401) {
        await _apiClient.getRefreshToken(id, getToken()!).then((response) {
          saveToken(response.data);
          pencatatanKehadiranAkhirDiLuarKantor(location, checkOutTime, description);
        });
      } else {
        dialog('ALERT', 'CHECK-OUT GAGAL');
      }
    });
  }

  void pencatatanKehadiranAwalDikantor(
      String location, String checkinTime, String description) async {
    id = getUserId()!;
    scheduleId = getScheduleId()!;
    token = getToken()!;
    await _apiClient
        .pencatatanKehadiranAwalDikantor(
            id, scheduleId, location, checkinTime, description, token)
        .then((response) async {
      if (response.status == 200) {
        statusCheckinOffline.value = true;
        statusCheckinOnline.value = true;
        dialog('SUCCESS', 'CHECK-IN BERHASIL');
      } else if (response.status == 401) {
        await _apiClient.getRefreshToken(id, getToken()!).then((response) {
          saveToken(response.data);
          pencatatanKehadiranAwalDikantor(location, checkinTime, description);
        });
      } else {
        dialog('ALERT', 'CHECK-IN GAGAL');
      }
    });
  }

  void pencatatanKehadiranAkhirDikantor(
      String location, String checkoutTime, String description) async {
    id = getUserId()!;
    scheduleId = getScheduleId()!;
    token = getToken()!;
    await _apiClient
        .checkoutOffline(
            id, scheduleId, location, checkoutTime, description, token)
        .then((response) async {
      if (response.status == 200) {
        statusCheckoutOffline.value = true;
        statusCheckoutOnline.value = true;
        dialog('SUCCESS', 'CHECK-OUT BERHASIL');
      } else if (response.status == 401) {
        await _apiClient.getRefreshToken(id, getToken()!).then((response) {
          saveToken(response.data);
          pencatatanKehadiranAkhirDikantor(location, checkoutTime, description);
        });
      } else {
        dialog('ALERT', 'CHECK-OUT GAGAL');
      }
    });
  }
}
