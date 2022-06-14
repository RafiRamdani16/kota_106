import 'dart:math';

import 'package:kota_106/Attendance/AttendanceModel.dart';
import 'package:kota_106/Approval/LeaveApproval/LeaveApprovalDetail/LeaveApprovalModel.dart';
import 'package:kota_106/Submission/Leave/LeaveModel.dart';
import 'package:kota_106/Submission/Overtime/OvertimeModel.dart';
import 'package:kota_106/Approval/PermitApproval/PermitApprovalDetail/PermitApprovalModel.dart';
import 'package:kota_106/Submission/Permit/PermitModel.dart';

import '../ActivityRecord/ActivityRecordModel.dart';
import '../Approval/OvertimeApproval/OvertimeApprovalDetail/OvertimeApprovalModel.dart';


class DummyData {
  List<AttendanceModel> dummy2 = List<AttendanceModel>.generate(
    5,
    (index) => AttendanceModel()
      ..id = index
      ..isLate = index < 3 ? false : true
      ..checkinAt = "2022-04-03 07:00"
      ..checkoutAt = "2022-04-03 17:00"
      ..locationCheckin = "Jalan Cisaranten Kulon, Arcamanik, Kota Bandung"
      ..locationCheckout = "Jalan Cisaranten Kulon, Arcamanik, Kota Bandung"
      ..descriptionCheckin = "testing Aplikasi $index"
      ..descriptionCheckout = "testing Aplikasi $index selesai"
      ..photoName = "Rafi.jpg"
      ..scheduleId = 2
      ..userId = 1,
  );

  String status(int index) {
    if (index < 2) {
      return "Remaining";
    } else if (index > 2 && index < 4) {
      return "Approved";
    } else {
      return "Rejected";
    }
  }

  int date(int index) {
    if (index > 10) {
      index = 1;
    }
    return index;
  }

  List<ActivityRecordModel> activityDummy = List<ActivityRecordModel>.generate(
      5,
      (index) => ActivityRecordModel()
        ..date = "2022-04-0${index > 10 ? 1 : index} 09:00"
        ..description = "Mengerjakan Authentication"
        ..location = "Jalan Cisaranten Kulon, Arcamanik, Kota Bandung"
        ..photoName = "Rafi.jpg"
        ..whatTimeIs = 1);

  List<PermitModel> permitDummy = List<PermitModel>.generate(
      4,
      (index) => PermitModel()
        ..permitDateSubmitted = "2022-02-${10 + index + 1}"
        // ..permitTimeSubmitted = "09.00"
        ..permitStartTime = "13:00"
        ..permitDate = "2022-05-${10 + index}"
        ..permitDescription = "Izin kerumah sakit"
        ..permitEndTime = "15:00"
        ..permitAttachment = "Photo.jpg"
        ..statusPermit = index < 3 ? "Rejected" : "Approved");

  List<OvertimeModel> overtimeDummy = List<OvertimeModel>.generate(
      10,
      (index) => OvertimeModel()
        ..overtimeDate = "2022-12-13"
        ..overtimeDateSubmitted = "2022-12-${10 + index + 2}"
        // ..overtimeTimeSubmitted = "15:00"
        ..overtimeDescription = "Testing Profile Aplikasi"
        ..overtimeStartTime = "20:00"
        ..overtimeEndTime = "21:00"
        ..overtimeStatus = index < 3 ? "Rejected" : "Approved");

  List<LeaveModel> leaveDummy = List<LeaveModel>.generate(
      4,
      (index) => LeaveModel()
        // ..leaveRemainingDays = "10 days"
        ..leaveDateSubmitted = "2022-05-${10 + index + 2}"
        ..leaveDescription = "Cuti dirawat karena sakit DBD"
        ..leaveStartDate = "2022-04-15"
        ..leaveEndDate = "2022-04-20"
        ..leaveStatus = index < 3 ? "Rejected" : "Approved"
        // ..leaveTimeSubmitted = "09:00"
        ..leaveType = "Sick Leave"
        ..leaveAttachment = "photo.jpg");

  List<PermitApprovalModel> permitApplicationDummy =
      List<PermitApprovalModel>.generate(
          4,
          (index) => PermitApprovalModel()
            ..permitDateSubmitted = "2022-09-${10 + index + 1}"
            ..permitTimeSubmitted = "09.00"
            ..permitStartTime = "13:00"
            ..permitDate = "2022-10-${10 + index}"
            ..permitDescription = "Izin Ke rumah sakit"
            ..permitEndTime = "15:00"
            ..permitAttachment = "Photo.jpg");

  List<OvertimeApprovalModel> overtimeApplicationDummy =
      List<OvertimeApprovalModel>.generate(
          4,
          (index) => OvertimeApprovalModel()
            ..overtimeDate = "2022-04-13"
            ..overtimeDateSubmitted = "2022-03-${10 + index + 2}"
            ..overtimeTimeSubmitted = "15:00"
            ..overtimeDescription = "Testing Aplikasi ke $index"
            ..overtimeStartTime = "20:00"
            ..overtimeEndTime = "21:00"
            ..overtimeAttachment = "photo.jpg");
  List<LeaveApprovalModel> leaveApplicationDummy =
      List<LeaveApprovalModel>.generate(
          4,
          (index) => LeaveApprovalModel()
            ..leaveRemainingDays = "10 days"
            ..leaveDateSubmitted = "2022-06-${10 + index}"
            ..leaveDescription = "Dirawat karena penyakit tipes"
            ..leaveStartDate = "2022-08-15"
            ..leaveEndDate = "2022-08-20"
            ..leaveTimeSubmitted = "09:00"
            ..leaveType = "Annual Leave"
            ..leaveAttachment = "photo.jpg");
}
