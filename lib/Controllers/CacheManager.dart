import 'package:get_storage/get_storage.dart';

mixin CacheManager {
  final box = GetStorage();

  Future<bool> saveToken(String? token) async {
    await box.write(CacheManagerKey.TOKEN.toString(), token);
    return true;
  }

  Future<void> removeToken() async {
    await box.remove(CacheManagerKey.TOKEN.toString());
  }

  Future<bool> saveRefreshToken(String? refreshToken) async {
    await box.write(CacheManagerKey.REFRESHTOKEN.toString(), refreshToken);
    return true;
  }

  String? getToken() {
    return box.read(CacheManagerKey.TOKEN.toString());
  }

  int? getUserId() {
    return box.read(CacheManagerKey.USERID.toString());
  }

  String? getName() {
    return box.read(CacheManagerKey.NAME.toString());
  }

  int? getScheduleId() {
    return box.read(CacheManagerKey.SCHEDULEID.toString());
  }

  String? getPosition() {
    return box.read(CacheManagerKey.POSITION.toString());
  }

  Future<void> clearStorage() async {
    await box.erase();
  }

  Future<bool> saveLoginData(
      String name, String position, int userId, int scheduleId) async {
    await box.write(CacheManagerKey.NAME.toString(), name);
    await box.write(CacheManagerKey.POSITION.toString(), position);
    await box.write(CacheManagerKey.USERID.toString(), userId);
    await box.write(CacheManagerKey.SCHEDULEID.toString(), scheduleId);
    return true;
  }

  Future<bool> saveCheckInTime(String checkinTime) async {
    await box.write(CacheManagerKey.CHECKINTIME.toString(), checkinTime);
    return true;
  }

  Future<bool> saveCheckOutTime(String checkoutTime) async {
    await box.write(CacheManagerKey.CHECKOUTTIME.toString(), checkoutTime);
    return true;
  }

  String? getCheckinTime() {
    return box.read(CacheManagerKey.CHECKINTIME.toString());
  }

  String? getCheckoutTime() {
    return box.read(CacheManagerKey.CHECKOUTTIME.toString());
  }

  Future<void> removeCheckinTime() async {
    await box.remove(CacheManagerKey.CHECKINTIME.toString());
  }

  Future<void> removeCheckoutTime() async {
    await box.remove(CacheManagerKey.CHECKOUTTIME.toString());
  }


}

enum CacheManagerKey {
  TOKEN,
  REFRESHTOKEN,
  USERID,
  SCHEDULEID,
  POSITION,
  NAME,
  CHECKINTIME,
  CHECKOUTTIME
}
