import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kota_106/Controllers/CacheManager.dart';
import 'package:sizer/sizer.dart';
class LeaveController extends GetxController with CacheManager {
  TextEditingController leaveType = TextEditingController();
  TextEditingController leaveRemaining = TextEditingController();
  TextEditingController leaveDescription = TextEditingController();
  TextEditingController remainingDays = TextEditingController();
  RxString selectedType = "Annual Leave".obs;

  DateTimeRange leaveDateTimeRange = DateTimeRange(
      start: DateTime.now(), end: DateTime.now().add(Duration(days: 31)));

  List<DropdownMenuItem<String>> typeLeave = [
    DropdownMenuItem(
      child: Text(
        "Annual Leave",
        style: TextStyle(fontSize: 11.sp),
      ),
      value: "Annual Leave",
    ),
    DropdownMenuItem(
      child: Text("Sick Leave", style: TextStyle(fontSize: 11.sp)),
      value: "Sick Leave",
    ),
    DropdownMenuItem(
      child: Text("Other Leave", style: TextStyle(fontSize: 11.sp)),
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
        lastDate: DateTime(DateTime.now().year + 1, DateTime.january, 0));

    if (newLeaveDateTime == null) {
      print("gagal");
      Get.back();
    } else {
      leaveDateTimeRange = newLeaveDateTime;
    }

    startLeaveDate.value = leaveDateTimeRange.start;
    endLeaveDate.value = leaveDateTimeRange.end;
  }

  void leaveForm() {
    Get.defaultDialog(
      radius: 10.0,
      contentPadding: const EdgeInsets.all(20.0),
      title: 'SUCCESS',
      titleStyle: TextStyle(color: Colors.green),
      middleText: 'Pengajuan cuti $leaveType berhasil',
      textConfirm: 'Confirm',
      confirm: OutlinedButton.icon(
        onPressed: () => Get.back(),
        icon: const Icon(
          Icons.check,
          color: Colors.green,
        ),
        label: const Text(
          'Confirm',
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}
