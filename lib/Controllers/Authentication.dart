import 'package:get/get.dart';

import 'CacheManager.dart';

class AuthenticationManager extends GetxController with CacheManager {
  final isLogged = false.obs;

  void logout() {
    isLogged.value = false;
    removeLoginData();
    removeToken();
    Get.offNamed('/splashScreen');
  }

  void login(String? token, String? refreshToken, String name, String position,
      int userId, int scheduleId) async {
    isLogged.value = true;
    await saveToken(token);
    await saveRefreshToken(refreshToken);
    await saveLoginData(name, position, userId, scheduleId);
  }

  void checkLoginStatus() {
    final token = getToken();
    final name = getName();
    final position = getPosition();
    if (token != null && name != null && position != null) {
      isLogged.value = true;
    }
  }
}
