import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kota_106/Screens/login/LoginScreen.dart';


import 'BindingsApplication.dart';
import 'Screens/Attendance/AttendancePage.dart';
import 'Screens/History/HistoryPage.dart';
import 'Screens/SplashScreen.dart';
import 'Screens/profile/ProfilePage.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      initialBinding: HomeBindings(),
      getPages: [
        GetPage(name: '/splashScreen', page: ()=> SplashScreen()),
        GetPage(name: '/', page: ()=> AttendanceScreen()),
        GetPage(name: '/loginPage', page: ()=> LoginScreen()),
        GetPage(name: '/profilePage', page: () => ProfileScreen()),
        GetPage(name: '/historyPage', page: () => HistoryScreen())
      ],
    );
  }
}

