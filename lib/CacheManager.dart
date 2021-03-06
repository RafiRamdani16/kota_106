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

  Future<void> removeName() async {
    await box.remove(CacheManagerKey.NAME.toString());
  }

  Future<void> removePhoto() async {
    await box.remove(CacheManagerKey.PHOTONAME.toString());
  }

  Future<void> removePosition() async {
    await box.remove(CacheManagerKey.POSITION.toString());
  }

  Future<void> removeSuperiorId() async {
    await box.remove(CacheManagerKey.POSITION.toString());
  }

  Future<void> removeRole() async {
    await box.remove(CacheManagerKey.ROLE.toString());
  }

  Future<bool> saveRefreshToken(String? refreshToken) async {
    await box.write(CacheManagerKey.REFRESHTOKEN.toString(), refreshToken);
    return true;
  }

  String? getToken() {
    return box.read(CacheManagerKey.TOKEN.toString());
  }

  int? getEmployeeId() {
    return box.read(CacheManagerKey.USERID.toString());
  }

  int? getSuperiorId() {
    return box.read(CacheManagerKey.SUPERIORID.toString());
  }

  String? getName() {
    return box.read(CacheManagerKey.NAME.toString());
  }

  String? getRole() {
    return box.read(CacheManagerKey.ROLE.toString());
  }

  String? getPhoto() {
    return box.read(CacheManagerKey.PHOTONAME.toString());
  }

  String? getPosition() {
    return box.read(CacheManagerKey.POSITION.toString());
  }

  Future<void> clearStorage() async {
    await box.erase();
  }

  Future<bool> saveLoginData(String name, String position, int userId,
      int superiorID, String role, String photoName) async {
    await box.write(CacheManagerKey.NAME.toString(), name);
    await box.write(CacheManagerKey.POSITION.toString(), position);
    await box.write(CacheManagerKey.USERID.toString(), userId);
    await box.write(CacheManagerKey.ROLE.toString(), role);
    await box.write(CacheManagerKey.SUPERIORID.toString(), superiorID);
    await box.write(CacheManagerKey.PHOTONAME.toString(), photoName);
    return true;
  }

  Future<bool> setName(String name) async {
    await box.write(CacheManagerKey.NAME.toString(), name);
    return true;
  }

  Future<bool> setPhoto(String photoName) async {
    await box.write(CacheManagerKey.PHOTONAME.toString(), photoName);
    return true;
  }

  Future<bool> setPosition(String position) async {
    await box.write(CacheManagerKey.POSITION.toString(), position);
    return true;
  }

  Future<bool> setRole(String position) async {
    await box.write(CacheManagerKey.ROLE.toString(), position);
    return true;
  }

  Future<bool> setSuperiorId(int superiorId) async {
    await box.write(CacheManagerKey.SUPERIORID.toString(), superiorId);
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
  ROLE,
  SUPERIORID,
  POSITION,
  NAME,
  CHECKINTIME,
  CHECKOUTTIME,
  PHOTONAME,
}
