import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kota_106/Screens/login/LoginScreen.dart';

import '../Screens/AttendanceScreen.dart';
import 'Authentication.dart';

class OnBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthenticationManager _authManager = Get.put(AuthenticationManager());
    return Obx(() {
      return _authManager.isLogged.value ? AttendanceScreen() : LoginScreen();
    });
  }
}
