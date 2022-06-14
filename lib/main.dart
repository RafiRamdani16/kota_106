import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:kota_106/ActivityRecord/ActivityRecordScreen.dart';
import 'package:kota_106/Login/LoginScreen.dart';
import 'package:sizer/sizer.dart';
import 'Approval/ApprovalScreen.dart';
import 'BindingsApplication.dart';
import 'Attendance/Offline/CheckIn/OfficeCheckInForm.dart';
import 'AttendanceScreen.dart';
import 'History/HistoryScreen.dart';
import 'SplashScreen.dart';
import 'Submission/AfterOvertime/AfterOvertimeScreen.dart';

import 'Profile/EditProfileScreen.dart';
import 'Profile/ProfileScreen.dart';
import 'Submission/Leave/LeaveScreen.dart';
import 'Submission/Overtime/OvertimeScreen.dart';
import 'Submission/Permit/PermitScreen.dart';

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
          GetPage(name: '/loginScreen', page: () => LoginScreen()),
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
