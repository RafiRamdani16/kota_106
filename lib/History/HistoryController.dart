import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:kota_106/CacheManager.dart';
import 'package:kota_106/ActivityRecord/ActivityRecordModel.dart';
import 'package:kota_106/Submission/AfterOvertime/AfterOvertimeModel.dart';
import 'package:kota_106/Attendance/AttendanceModel.dart';
import 'package:kota_106/Submission/Leave/LeaveModel.dart';
import 'package:kota_106/Submission/Overtime/OvertimeModel.dart';
import 'package:kota_106/Submission/Permit/PermitModel.dart';

import '../APIService/ApiService.dart';

class HistoryController extends GetxController with CacheManager {
  TextEditingController locationCheckin2 = TextEditingController();
  TextEditingController locationCheckout = TextEditingController();
  TextEditingController doneList = TextEditingController();
  TextEditingController locationNow = TextEditingController();
  TextEditingController dateNow = TextEditingController();
  TextEditingController timeNow = TextEditingController();
  TextEditingController description = TextEditingController();

  RxBool isThereItemAttendance = false.obs;
  RxBool isThereItemActivity = false.obs;

  RxString checkInTime = "".obs;
  RxString checkInDate = "".obs;
  RxString checkOutTime = "".obs;
  RxString checkOutDate = "".obs;
  RxString activityRecordTime = "".obs;
  RxString activityRecordDate = "".obs;
  RxInt day = 0.obs;
  RxString month = "".obs;
  RxInt workingTime = 0.obs;
  RxInt page = 1.obs;
  RxInt limit = 10.obs;
  RxString permitStatus = "".obs;

  RxInt checkInHour = 0.obs;
  RxInt checkOutHour = 0.obs;
  List rawData = [];
  List data = [];
  int employeeId = -1;
  String token = "";
  int scheduleId = -1;

  List<AttendanceModel> attendanceHistory = <AttendanceModel>[];
  List<ActivityRecordModel> activityRecordHistoryList = <ActivityRecordModel>[];
  List<PermitModel> permitHistory = <PermitModel>[];
  List<OvertimeModel> overtimeHistory = <OvertimeModel>[];
  List<LeaveModel> leaveHistory = <LeaveModel>[];
  List<AfterOvertimeModel> afterOvertimeModel = <AfterOvertimeModel>[]; 

  ApiClient _apiClient = Get.put(ApiClient(Dio()));

  Future<void> attendanceHistoryList() async {
   

    employeeId = getEmployeeId()!;
    token = getToken()!;

    await _apiClient
        .getHistoryAttendance(
            'UserId==$employeeId', "-CreatedAt", page.value, limit.value, token)
        .then((response) async {
      print(response.status);
      if (response.status == 200) {
        attendanceHistory = response.data.data.toList();
        isThereItemAttendance.value = true;
      } else if (response.status == 401) {
        await _apiClient
            .getRefreshToken(employeeId, getToken()!)
            .then((response) {
          saveToken(response.data);
          attendanceHistoryList();
        });
      }
    });
  }

  Future<void> activityRecordHistory() async {
    employeeId = getEmployeeId()!;
    token = getToken()!;
    await _apiClient
        .getHistoryActivityRecord(
            'UserId==$employeeId', "-CreatedAt", page.value, limit.value, token)
        .then((response) async {
      if (response.status == 200) {
        activityRecordHistoryList = response.data.data.toList();

        isThereItemActivity.value = true;
        update();
        await Future.delayed(Duration(seconds: 3));
      } else if (response.status == 401) {
        await _apiClient
            .getRefreshToken(employeeId, getToken()!)
            .then((response) {
          saveToken(response.data);
          activityRecordHistory();
        });
      }
    });
  }

  Future<void> getPermitHistory() async {
    employeeId = getEmployeeId()!;
    token = getToken()!;

    await _apiClient
        .getPermitHistory(
            "UserId==$employeeId", "-Id", page.value, limit.value, token)
        .then((response) async {
      if (response.status == 200) {
        print(response.data.data.toList());
        permitHistory = response.data.data.toList();
      } else if (response.status == 401) {
        await _apiClient.getRefreshToken(employeeId, token).then((response) {
          removeToken();
          saveToken(response.data);
          getPermitHistory();
        });
      } else {
        return false;
      }
    });
  }

  Future<void> getOvertimeHistory() async {
    employeeId = await getEmployeeId()!;
    token = await getToken()!;
    print(token);
    print(employeeId);

    await _apiClient
        .getOvertimeHistory(
            'UserId==$employeeId', "-Id", page.value, limit.value, token)
        .then((response) async {
      print(response.status);
      if (response.status == 200) {
        overtimeHistory = response.data.data.toList();
        // isThereItemAttendance.value = true;
      } else if (response.status == 401) {
        await _apiClient
            .getRefreshToken(employeeId, getToken()!)
            .then((response) {
          removeToken();
          saveToken(response.data);
          attendanceHistoryList();
        });
      } else {
        return false;
      }
    });
  }

  Future<void> getLeaveHistory() async {
    employeeId = getEmployeeId()!;
    token = getToken()!;
    await _apiClient
        .getLeaveHistory(
            "UserId == $employeeId", "-Id", page.value, limit.value, token)
        .then((response) async {
      if (response.status == 200) {
        leaveHistory = response.data.data.toList();
      } else if (response.status == 401) {
        await _apiClient.getRefreshToken(employeeId, token).then((response) {
          removeToken();
          saveToken(token);
          getPermitHistory();
        });
      } else {
        return false;
      }
    });
  }

  Future<void> getAfterOvertimeHistory(int idOvertime) async {
    employeeId = getEmployeeId()!;
    token = getToken()!;
    await _apiClient
        .getAfterOvertimeHistory(
            "UserId == $employeeId", "-CreatedAt", 1, 20, token)
        .then((response) async {
      if (response.status == 200) {
        afterOvertimeModel = response.data.data;
      } else if (response.status == 200) {
        await _apiClient.getRefreshToken(employeeId, token).then((response) {
          removeToken();
          saveToken(token);
          getAfterOvertimeHistory(idOvertime);
        });
      } else {
        return false;
      }
    });
  }

  Color checkStatus(String permitStatus) {
    if (permitStatus == "Remaining") {
      return Colors.amber;
    } else if (permitStatus == "Approved") {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  bool isHR() {
    String role = getRole()!;
    if (role == "HR") {
      return false;
    } else {
      return true;
    }
  }

  bool isAtasan() {
    int superiorId = getSuperiorId()!;
    if (superiorId != 0) {
      return true;
    } else {
      return false;
    }
  }

  Widget setImageView(
      String photoName, double width, double height, String type) {
    if (type == "Attendance") {
      return Image.asset(
        'assets/images/selfie2.jpg',
        width: width,
        height: height,
      );
    } else if (type == "Activity Record") {
      return Image.asset(
        'assets/images/selfie.jpg',
        width: width,
        height: height,
      );
    } else if (type == "Permit") {
      return Image.asset(
        'assets/images/TestingSuketSakit.jpg',
        width: width,
        height: height,
      );
    } else if (type == "Overtime") {
      return Image.asset(
        'assets/images/testingProfile.jpg',
        width: width,
        height: height,
      );
    } else {
      return Image.asset(
        'assets/images/TestingSuketSakit.jpg',
        width: width,
        height: height,
      );
    }
  }

  void formatDate(String rawDate) async {
    DateTime formatedDateTime = DateTime.parse(rawDate);
    day.value = formatedDateTime.day;

    month.value =
        DateFormat('MMMM').format(DateTime(0, formatedDateTime.month));
  }

  void changeFormatDateForActivityHistory(String rawDate) async {
    DateTime formatedDateTime = DateTime.parse(rawDate);
    activityRecordDate.value =
        DateFormat('dd MMMM yyyy').format(formatedDateTime);
    activityRecordTime.value = DateFormat('HH:mm').format(formatedDateTime);
    day.value = formatedDateTime.day;
    month.value =
        DateFormat('MMMM').format(DateTime(0, formatedDateTime.month));
  }

  void changeFormatCheckinDateForAttendanceHistory(String rawDate) async {
    DateTime formatedTime = DateTime.parse(rawDate);

    checkInDate.value = DateFormat('yyyy-MM-dd').format(formatedTime);
    checkInTime.value = DateFormat('HH:mm').format(formatedTime);
    checkInHour.value = formatedTime.hour;
    day.value = formatedTime.day;
    month.value = DateFormat('MMMM').format(DateTime(0, formatedTime.month));
  }

  void changeFormatCheckoutDateForAttendanceHistory(String rawDate) async {
    DateTime formatedTime = DateTime.parse(rawDate);

    checkOutDate.value = DateFormat('yyyy-MM-dd').format(formatedTime);
    checkOutTime.value = DateFormat('HH:mm').format(formatedTime);

    checkOutHour.value = formatedTime.hour;
    getWorkingTime();
  }

  void getWorkingTime() {
    workingTime.value = checkOutHour.value - checkInHour.value;
  }
}
