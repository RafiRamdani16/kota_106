import 'package:kota_106/Models/AttendanceModel.dart';

import '../Models/ActivityRecordModel.dart';

class DummyData {
  List<AttendanceModel> dummy2 = List<AttendanceModel>.generate(
    9,
    (index) => AttendanceModel()
      ..id = index
      ..isLate = false
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

  int date(int index) {
    if (index > 10) {
      index = 1;
    }
    return index;
  }

  List<ActivityRecordModel> activityDummy = List<ActivityRecordModel>.generate(
      100,
      (index) => ActivityRecordModel()
        ..date = "2022-04-0${index > 10 ? 1 : index} 09:00"
        ..description = "Mengerjakan Authentication"
        ..location = "Jalan Cisaranten Kulon, Arcamanik, Kota Bandung"
        ..photoName = "Rafi.jpg"
        ..whatTimeIs = 1);

 
}
