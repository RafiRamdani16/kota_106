import 'package:kota_106/Models/ActivityRecordModel.dart';
import 'package:kota_106/Models/AttendanceModel.dart';

class DummyData {
  List<AttendanceModel> dummy2 = List<AttendanceModel>.generate(
    9,
    (index) => AttendanceModel()
      ..id = index
      ..isLate = "false"
      ..checkinAt = "2022-04-03 07:00"
      ..checkoutAt = "2022-04-03 17:00"
      ..locationCheckin = "Jalan Cisaranten Kulon, Arcamanik, Kota Bandung"
      ..locationCheckout = "Jalan Cisaranten Kulon, Arcamanik, Kota Bandung"
      ..descriptionCheckin = "testing Aplikasi"
      ..descriptionCheckout = "testing Aplikasi selesai"
      ..photoName = "Rafi.jpg"
      ..scheduleId = 2
      ..userId = 1,
  );
  
  List<ActivityRecordModel> activityDummy = List<ActivityRecordModel>.generate(
      100,
      (index) => ActivityRecordModel()
        ..date = "$index"
        ..description = "Mengerjakan Authentication"
        ..location = "Jalan Cisaranten Kulon, Arcamanik, Kota Bandung"
        ..photoName = "Rafi.jpg"
        ..time = "09:10"
        );
}
