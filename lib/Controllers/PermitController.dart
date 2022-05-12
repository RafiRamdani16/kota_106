import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
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
  Rx<TimeOfDay> permitStartTime = TimeOfDay(hour: 7, minute: 0).obs;
  Rx<TimeOfDay> permitEndTime = TimeOfDay(hour: 17, minute: 0).obs;

  void permitDatePicker(BuildContext context) async {
    DateTime? newDate = await showDatePicker(
        context: context,
        initialDate: permitSelectedDate.value,
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 1, DateTime.january, 0));

    if (newDate == null) {
      Get.back();
    } else {
      permitSelectedDate.value = newDate;
    }
  }

  // void permitStartTimePicker(BuildContext context) async {
  //   TimeOfDay? newTime = await showTimePicker(
  //     context: context,
  //     initialTime: permitStartTime.value,
  //   );

  //   if (newTime == null) {
  //     Get.back();
  //   } else if (newTime) {
  //     dialog("ALERT!!!", "Start Time Invalid!!!");
  //   } else {
  //     permitStartTime.value = newTime;
  //   }
  // }

  // void permitEndTimePicker(BuildContext context) async {
  //   TimeOfDay? newTime = await showTimePicker(
  //       initialEntryMode: TimePickerEntryMode.input,
  //       context: context,
  //       initialTime: permitEndTime.value);

  //   if (newTime == null) {
  //     Get.back();
  //   } else {
  //     permitEndTime.value = newTime;
  //   }
  // }

  void permitTimePicker(BuildContext context) async {
    TimeRange? newTime = await showTimeRangePicker(
      context: context,
      interval: Duration(minutes: 5),
      start: permitStartTime.value,
      end: permitEndTime.value,
      maxDuration: Duration(hours: 8),
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
      Get.back();
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
}
