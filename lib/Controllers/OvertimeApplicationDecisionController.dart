import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kota_106/Controllers/CacheManager.dart';
import 'package:kota_106/DummyData/DummyData.dart';

import '../Models/OvertimeApplicationDecisionModel.dart';

class OvertimeDecisionApplicationController extends GetxController
    with CacheManager {
  RxString employeeName = "".obs;
  RxString employeePosition = "".obs;
  RxString overtimeDescription = "".obs;
  RxString overtimeDate = "".obs;
  RxString overtimeStartTime = "".obs;
  RxString overtimeEndTime = "".obs;
  RxString overtimeAttachment = "".obs;
  RxInt day = 0.obs;
  RxString month = "".obs;
  List<OvertimeApplicationDecisionModel> overtimeApplication =
      <OvertimeApplicationDecisionModel>[];

  Future<void> getOvertimeApplication() async {
    DummyData dummyData = Get.put(DummyData());
    overtimeApplication = dummyData.overtimeApplicationDummy;
    overtimeApplication.add(OvertimeApplicationDecisionModel()
      ..employeeName = "Fahreza Ramadhani"
      ..employeePosition = "Junior Programmer"
      ..overtimeDate = "2022-04-13"
      ..overtimeDateSubmitted = "2022-03-17"
      ..overtimeTimeSubmitted = "15:00"
      ..overtimeDescription = "Testing Aplikasi ke 17"
      ..overtimeStartTime = "20:00"
      ..overtimeEndTime = "21:00"
      ..overtimeStatus = "Remaining"
      ..overtimeAttachment = "photo.jpg");
  }

  void formatDate(String rawDate) async {
    DateTime formatedDateTime = DateTime.parse(rawDate);
    day.value = formatedDateTime.day;

    month.value =
        DateFormat('MMMM').format(DateTime(0, formatedDateTime.month));
  }
}
