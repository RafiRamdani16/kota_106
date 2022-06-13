import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:kota_106/Screens/ActivityRecord/ActivityRecordScreen.dart';
import 'package:kota_106/Screens/login/LoginScreen.dart';
import 'package:sizer/sizer.dart';
import 'BindingsApplication.dart';
import 'Screens/Approval/ApprovalScreen.dart';
import 'Screens/Attendance/OfficeCheckInForm.dart';
import 'Screens/AttendanceScreen.dart';
import 'Screens/History/HistoryOvertime/AfterOvertimeScreen.dart';
import 'Screens/History/HistoryScreen.dart';

import 'Screens/SplashScreen.dart';
import 'Screens/Submission/Leave/LeaveScreen.dart';
import 'Screens/Submission/Overtime/OvertimeScreen.dart';
import 'Screens/Submission/Permit/PermitScreen.dart';
import 'Screens/profile/EditProfileScreen.dart';
import 'Screens/profile/ProfileScreen.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Attendance CV Garuda',
        theme: ThemeData(
          primarySwatch: Colors.amber,
          fontFamily: "Roboto",
        ),
        initialRoute: '/splashScreen',
        initialBinding: HomeBindings(),
        getPages: [
          GetPage(name: '/splashScreen', page: () => SplashScreen()),
          GetPage(name: '/', page: () => AttendanceScreen()),
          GetPage(name: '/loginPage', page: () => LoginScreen()),
          GetPage(name: '/profileScreen', page: () => ProfileScreen()),
          GetPage(name: '/editProfileScreen', page: () => EditProfileScreen()),
          GetPage(name: '/historyScreen', page: () => HistoryScreen()),
          GetPage(name: '/officeCheckIn', page: () => OfficeCheckInForm()),
          GetPage(name: '/activityRecord', page: () => ActivityRecordScreen()),
          GetPage(
              name: '/addActivityRecord', page: () => ActivityRecordScreen()),
          GetPage(name: '/leaveScreen', page: () => LeaveScreen()),
          GetPage(name: '/permitScreen', page: () => PermitScreen()),
          GetPage(name: '/overtimeScreen', page: () => OvertimeScreen()),
          GetPage(
              name: '/afterOvertimeScreen', page: () => AfterOvertimeScreen()),
          GetPage(name: '/approvalScreen', page: () => ApprovalScreen()),
        ],
      );
    });
  }
}
