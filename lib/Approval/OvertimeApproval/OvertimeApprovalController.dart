import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kota_106/CacheManager.dart';
import 'package:kota_106/DummyData/DummyData.dart';

import 'OvertimeApprovalDetail/OvertimeApprovalModel.dart';

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
  List<OvertimeApprovalModel> overtimeApproval = <OvertimeApprovalModel>[];

  Future<void> getOvertimeApplication() async {}

  void formatDate(String rawDate) async {
    DateTime formatedDateTime = DateTime.parse(rawDate);
    day.value = formatedDateTime.day;

    month.value =
        DateFormat('MMMM').format(DateTime(0, formatedDateTime.month));
  }
}
