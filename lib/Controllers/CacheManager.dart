import 'package:get/get.dart';
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
    return box.read(CacheManagerKey.userId.toString());
  }

  String? getName() {
    return box.read(CacheManagerKey.name.toString());
  }
  int? getScheduleId() {
    return box.read(CacheManagerKey.scheduleId.toString());
  }
  String? getPosition() {
    return box.read(CacheManagerKey.position.toString());
  }

  Future<void> removeToken() async {
    await box.remove(CacheManagerKey.TOKEN.toString());
    Get.offAndToNamed('/loginPage');
  }

  Future<bool> saveLoginData(
      String name, String position, int userId, int scheduleId) async {
    await box.write(CacheManagerKey.name.toString(), name);
    await box.write(CacheManagerKey.position.toString(), position);
    await box.write(CacheManagerKey.userId.toString(), userId);
    await box.write(CacheManagerKey.scheduleId.toString(), scheduleId);
    return true;
  }

  Future<void> removeLoginData() async {
    await box.remove(CacheManagerKey.name.toString());
    await box.remove(CacheManagerKey.position.toString());
    await box.remove(CacheManagerKey.userId.toString());
    await box.remove(CacheManagerKey.scheduleId.toString());
  }
}
enum CacheManagerKey { TOKEN, REFRESHTOKEN, userId, scheduleId, position, name }
