import 'package:get/get.dart';
import 'package:kota_106/ActivityRecord/ActivityRecordController.dart';
import 'package:kota_106/History/HistoryController.dart';
import 'package:kota_106/Approval/LeaveApproval/LeaveApprovalController.dart';
import 'package:kota_106/Submission/Leave/LeaveController.dart';
import 'package:kota_106/Login/LoginController.dart';
import 'package:kota_106/Submission/Permit/PermitController.dart';
import 'package:kota_106/Approval/PermitApproval/PermitApprovalController.dart';

import 'Attendance/AttendanceController.dart';
import 'Approval/OvertimeApproval/OvertimeApprovalController.dart';
import 'Submission/Overtime/OvertimeController.dart';
import 'Profile/ProfileController.dart';

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
    Get.put<OvertimeApprovalController>(OvertimeApprovalController());
    Get.put<LeaveApprovalController>(LeaveApprovalController());
  }
}
