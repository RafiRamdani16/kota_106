import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kota_106/Controllers/CacheManager.dart';

class LeaveController extends GetxController with CacheManager {
  TextEditingController leaveStartDate = TextEditingController();
  TextEditingController leaveEndDate = TextEditingController();
  TextEditingController leaveType = TextEditingController();
  TextEditingController leaveRemaining = TextEditingController();
  TextEditingController leaveDescription = TextEditingController();
  TextEditingController remainingDays = TextEditingController();
  RxString selectedType = "Annual Leave".obs;


  DateTimeRange leaveDateTimeRange = DateTimeRange(
      start: DateTime.now(), end: DateTime.now().add(Duration(days: 31)));

  List<DropdownMenuItem<String>> typeLeave = [
    DropdownMenuItem(
      child: Text("Annual Leave"),
      value: "Annual Leave",
    ),
    DropdownMenuItem(
      child: Text("Sick Leave"),
      value: "Sick Leave",
    ),
    DropdownMenuItem(
      child: Text("Other Leave"),
      value: "Other Leave",
    ),
  ];

  var startLeaveDate = DateTime.now().obs;
  var endLeaveDate = DateTime.now().add(Duration(days: 7)).obs;
  var currentDate = DateTime.now();

  void pickLeaveDate(BuildContext context) async {
    
    DateTimeRange? newLeaveDateTime = await showDateRangePicker(
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        context: context,
        initialDateRange: leaveDateTimeRange,
        firstDate: DateTime.now(),
        lastDate: DateTime(
            DateTime.now().year + 1, DateTime.january,0));

    if (newLeaveDateTime == null) {
      print("gagal");
      Get.back();
    } else {
      leaveDateTimeRange = newLeaveDateTime;
    }

    startLeaveDate.value = leaveDateTimeRange.start;
    endLeaveDate.value = leaveDateTimeRange.end;
  }
}
