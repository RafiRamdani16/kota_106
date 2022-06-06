import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kota_106/Controllers/CacheManager.dart';
import 'package:time_range_picker/time_range_picker.dart';

class PermitController extends GetxController with CacheManager {
  TextEditingController permitDate = TextEditingController();
  // TextEditingController permitStartTime = TextEditingController();
  // TextEditingController permitEndTime = TextEditingController();
  TextEditingController permitDescription = TextEditingController();

  Rx<DateTime> permitSelectedDate = DateTime.now().obs;
  var permitStartTime = TimeOfDay(hour: 8, minute: 0).obs;
  var permitEndTime = TimeOfDay(hour: 17, minute: 0).obs;

  void permitDatePicker(BuildContext context) async {
    DateTime? newDate = await showDatePicker(
        context: context,
        initialDate: permitSelectedDate.value,
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 1, DateTime.january, 0));

    if (newDate == null) {
    } else {
      permitSelectedDate.value = newDate;
    }
  }

  void editPermitDatePicker(BuildContext context) async {
    DateTime? newDate = await showDatePicker(
        context: context,
        initialDate: permitSelectedDate.value,
        firstDate: DateTime(DateTime.now().year, DateTime.january),
        lastDate: DateTime(DateTime.now().year + 1, DateTime.january, 0));
    if (newDate == null) {
    } else {
      permitSelectedDate.value = newDate;
    }
  }

  void permitTimePicker(BuildContext context) async {
    TimeRange? newTime = await showTimeRangePicker(
      context: context,
      interval: Duration(minutes: 5),
      start: permitStartTime.value,
      end: permitEndTime.value,
      maxDuration: Duration(hours: 4),
      disabledTime: TimeRange(
          startTime: TimeOfDay(hour: 17, minute: 1),
          endTime: TimeOfDay(hour: 6, minute: 59)),
      disabledColor: Colors.white,
      strokeColor: HexColor("FCBC45"),
      ticksColor: HexColor("FCBC45"),
      handlerColor: HexColor("FCBC45"),
      selectedColor: HexColor("FCBC45").withOpacity(0.5),
    );
    if (newTime == null) {
    } else {
      permitStartTime.value = newTime.startTime;
      permitEndTime.value = newTime.endTime;
    }
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

  void permitForm() {
    dialog("SUCCESS", "Pengajuan Izin Berhasil");
  }
}
