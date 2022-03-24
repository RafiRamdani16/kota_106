import 'package:get/get.dart';
import 'package:kota_106/Controllers/ActivityRecordController.dart';
import 'package:kota_106/Controllers/HistoryController.dart';
import 'package:kota_106/Controllers/LoginController.dart';

import 'Controllers/AttendanceController.dart';
import 'Controllers/ProfileController.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<AttendanceController>(AttendanceController());
    Get.put<LoginController>(LoginController());
    Get.put<ActivityRecordController>(ActivityRecordController());
    Get.put<HistoryController>(HistoryController());
    Get.put<ProfileController>(ProfileController());
  }
}
