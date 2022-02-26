import 'package:get/get.dart';
import 'package:kota_106/Controllers/AttendanceController/HistoryAttendanceController.dart';
import 'package:kota_106/Controllers/LoginController.dart';

import 'Controllers/AttendanceController/AttendanceController.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<AttendanceController>(AttendanceController());
    Get.put<LoginController>(LoginController());
    Get.put<HistoryAttendanceController>(HistoryAttendanceController());
  }
}
