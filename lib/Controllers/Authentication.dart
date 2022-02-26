import 'package:get/get.dart';

import 'CacheManager.dart';

class AuthenticationManager extends GetxController with CacheManager {
  final isLogged = false.obs;

  void logout() {
    isLogged.value = false;
    removeLoginData();
    removeToken();
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
    if (token != null) {
      isLogged.value = true;
    }
  }
}
