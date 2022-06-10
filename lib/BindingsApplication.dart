import 'package:get/get.dart';
import 'package:kota_106/Controllers/ActivityRecordController.dart';
import 'package:kota_106/Controllers/HistoryController.dart';
import 'package:kota_106/Controllers/LeaveApplicationDecisionController.dart';
import 'package:kota_106/Controllers/LeaveController.dart';
import 'package:kota_106/Controllers/LoginController.dart';
import 'package:kota_106/Controllers/PermitController.dart';
import 'package:kota_106/Controllers/PermitApprovalController.dart';

import 'Controllers/AttendanceController.dart';
import 'Controllers/OvertimeApprovalController.dart';
import 'Controllers/OvertimeController.dart';
import 'Controllers/ProfileController.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<AttendanceController>(AttendanceController());
    Get.put<LoginController>(LoginController());
    Get.put<ActivityRecordController>(ActivityRecordController());
    Get.put<HistoryController>(HistoryController());
    Get.put<ProfileController>(ProfileController());
    Get.put<LeaveController>(LeaveController());
    Get.put<PermitController>(PermitController());
    Get.put<OvertimeController>(OvertimeController());
    Get.put<PermitApprovalController>(PermitApprovalController());
    Get.put<OvertimeDecisionApplicationController>(
        OvertimeDecisionApplicationController());
        Get.put<LeaveApplicationDecisionController>(
        LeaveApplicationDecisionController());
  }
}
