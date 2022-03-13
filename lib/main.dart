import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kota_106/Screens/ActivityRecord/ActivityRecordScreen.dart';
import 'package:kota_106/Screens/ActivityRecord/AddActivityRecordScreen.dart';

import 'package:kota_106/Screens/login/LoginScreen.dart';

import 'BindingsApplication.dart';
import 'Screens/Attendance/Attendance/OfficeCheckInForm.dart';
import 'Screens/Attendance/AttendanceScreen.dart';
import 'Screens/History/HistoryScreen.dart';
import 'Screens/SplashScreen.dart';
import 'Screens/profile/EditProfileScreen.dart';
import 'Screens/profile/ProfileScreen.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/editProfileScreen',
      initialBinding: HomeBindings(),
      getPages: [
        GetPage(name: '/splashScreen', page: () => SplashScreen()),
        GetPage(name: '/', page: () => AttendanceScreen()),
        GetPage(name: '/loginPage', page: () => LoginScreen()),
        GetPage(name: '/profileScreen', page: () => ProfileScreen()),
        GetPage(name: '/editProfileScreen', page: () => EditProfileScreen()),
        GetPage(name: '/historyPage', page: () => HistoryScreen()),
        GetPage(name: '/officeCheckIn', page: () => OfficeCheckInForm()),
        GetPage(name: '/activityRecord', page: () => ActivityRecordScreen()),
        GetPage(name: '/addActivityRecord', page: () => AddActivityRecordScreen()),
      ],
    );
  }
}
