
import 'package:get_storage/get_storage.dart';

mixin CacheManager {
  final box = GetStorage();
  Future<bool> saveToken(String? token) async {
    await box.write(CacheManagerKey.TOKEN.toString(), token);
    return true;
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

  Future<void> removeToken() async {
    await box.remove(CacheManagerKey.TOKEN.toString());
  }

  Future<bool> saveLoginData(
      String name, String position, int userId, int scheduleId) async {
    await box.write(CacheManagerKey.NAME.toString(), name);
    await box.write(CacheManagerKey.POSITION.toString(), position);
    await box.write(CacheManagerKey.USERID.toString(), userId);
    await box.write(CacheManagerKey.SCHEDULEID.toString(), scheduleId);
    return true;
  }

  Future<void> removeLoginData() async {
    await box.remove(CacheManagerKey.NAME.toString());
    await box.remove(CacheManagerKey.POSITION.toString());
    await box.remove(CacheManagerKey.USERID.toString());
    await box.remove(CacheManagerKey.SCHEDULEID.toString());
  }
}
enum CacheManagerKey { TOKEN, REFRESHTOKEN, USERID, SCHEDULEID, POSITION, NAME }
