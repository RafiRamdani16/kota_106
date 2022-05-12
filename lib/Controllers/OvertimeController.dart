import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kota_106/Controllers/CacheManager.dart';
import 'package:time_range_picker/time_range_picker.dart';

class OvertimeController extends GetxController with CacheManager {
  TextEditingController overtimeDate = TextEditingController();
  // TextEditingController permitStartTime = TextEditingController();
  // TextEditingController permitEndTime = TextEditingController();
  TextEditingController overtimeDescription = TextEditingController();

  Rx<DateTime> overtimeSelectedDate = DateTime.now().obs;
  Rx<TimeOfDay> overtimeStartTime = TimeOfDay(hour: 7, minute: 0).obs;
  Rx<TimeOfDay> overtimeEndTime = TimeOfDay(hour: 17, minute: 0).obs;

  void overtimeDatePicker(BuildContext context) async {
    DateTime? newDate = await showDatePicker(
        context: context,
        initialDate: overtimeSelectedDate.value,
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 1, DateTime.january, 0));

    if (newDate == null) {
      Get.back();
    } else {
      overtimeSelectedDate.value = newDate;
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

  void overtimeTimePicker(BuildContext context) async {
    TimeRange? newTime = await showTimeRangePicker(
      context: context,
      interval: Duration(minutes: 5),
      start: overtimeStartTime.value,
      end: overtimeEndTime.value,
      maxDuration: Duration(hours: 8),
      disabledColor: Colors.white,
      strokeColor: HexColor("FCBC45"),
      ticksColor: HexColor("FCBC45"),
      handlerColor: HexColor("FCBC45"),
      selectedColor: HexColor("FCBC45").withOpacity(0.5),
    );
    if (newTime == null) {
      Get.back();
    } else {
      overtimeStartTime.value = newTime.startTime;
      overtimeEndTime.value = newTime.endTime;
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
