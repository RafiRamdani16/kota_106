import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:kota_106/CacheManager.dart';
import 'package:kota_106/ActivityRecord/ActivityRecordModel.dart';
import 'package:kota_106/Attendance/AttendanceModel.dart';
import 'package:kota_106/Submission/Leave/LeaveModel.dart';

import '../APIService/ApiService.dart';
import '../Submission/SubmissionModel.dart';
import 'History After Overtime/DetailAfterOvertimeScreen.dart';

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
  List<SubmissionModel> permitHistory = <SubmissionModel>[];
  List<SubmissionModel> overtimeHistory = <SubmissionModel>[];
  List<LeaveModel> leaveHistory = <LeaveModel>[];
  List<SubmissionModel> afterOvertimeModel = <SubmissionModel>[];

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
        if (attendanceHistory.isEmpty) {
          message("ALERT", "Tidak Ada Riwayat");
        }
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
        if (activityRecordHistoryList.isEmpty) {
          message("ALERT", "Tidak Ada Riwayat");
        }
        update();
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
        .getSubmissionHistory("UserId==$employeeId, SubmissionType==Permit",
            "-SubmissionId", page.value, limit.value, token)
        .then((response) async {
      if (response.status == 200) {
        print(response.data.data.toList());
        permitHistory = response.data.data.toList();
        if (permitHistory.isEmpty) {
          message("ALERT", "Tidak Ada Riwayat");
        }
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
        .getSubmissionHistory('UserId == $employeeId, SubmissionType==Overtime',
            "-SubmissionId", page.value, limit.value, token)
        .then((response) async {
      print(response.status);
      if (response.status == 200) {
        overtimeHistory = response.data.data.toList();
        // isThereItemAttendance.value = true;
        if (overtimeHistory.isEmpty) {
          message("ALERT", "Tidak Ada Riwayat");
        }
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
        .getLeaveHistory("UserId == $employeeId", "-SubmissionLeaveId",
            page.value, limit.value, token)
        .then((response) async {
      if (response.status == 200) {
        leaveHistory = response.data.data.toList();
        if (leaveHistory.isEmpty) {
          message("ALERT", "Tidak Ada Riwayat");
        }
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

  Future<void> getAfterOvertimeHistory(
      int idOvertime, BuildContext context) async {
    employeeId = getEmployeeId()!;
    token = getToken()!;
    await _apiClient
        .getSubmissionHistory(
            'OvertimeId == $idOvertime', "", page.value, limit.value, token)
        .then((response) async {
      if (response.status == 200) {
        afterOvertimeModel = response.data.data;
        if (afterOvertimeModel.isEmpty) {
          Get.back();
          message("ALERT", "Tidak Terdapat Pengajuan Setelah Lembur");
        } else {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return DetailAfterOvertimeHistory();
              });
        }
      } else if (response.status == 401) {
        await _apiClient.getRefreshToken(employeeId, token).then((response) {
          removeToken();
          saveToken(token);
          getAfterOvertimeHistory(idOvertime, context);
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
    return Image.network(
      'https://62fe-2001-448a-304b-15a6-14bf-8f81-47ae-195d.ngrok.io/$photoName',
      width: width,
      height: height,
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return Text("Tidak ada Attachment");
      },
    );
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
    activityRecordTime.value =
        DateFormat('HH:mm').format(formatedDateTime.toLocal());
    day.value = formatedDateTime.day;
    month.value =
        DateFormat('MMMM').format(DateTime(0, formatedDateTime.month));
  }

  void changeFormatCheckinDateForAttendanceHistory(String rawDate) async {
    print(rawDate);
    DateTime formatedTime = DateTime.parse(rawDate).toLocal();

    checkInDate.value = DateFormat('yyyy-MM-dd', "id_ID").format(formatedTime);
    checkInTime.value =
        DateFormat('HH:mm', "id_ID").format(formatedTime.toLocal());
    print(checkInTime);
    print(formatedTime);
    print(DateTime.parse(rawDate).isUtc);
    checkInHour.value = formatedTime.hour;
    day.value = formatedTime.day;
    month.value = DateFormat('MMMM').format(DateTime(0, formatedTime.month));
  }

  void changeFormatCheckoutDateForAttendanceHistory(String rawDate) async {
    DateTime formatedTime = DateTime.parse(rawDate).toLocal();

    checkOutDate.value = DateFormat('yyyy-MM-dd').format(formatedTime);
    checkOutTime.value =
        DateFormat('HH:mm', "id_ID").format(formatedTime.toLocal());

    checkOutHour.value = formatedTime.hour;
    getWorkingTime();
  }

  void getWorkingTime() {
    workingTime.value = checkOutHour.value - checkInHour.value;
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
}
