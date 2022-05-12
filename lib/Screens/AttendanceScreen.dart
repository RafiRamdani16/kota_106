import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kota_106/Controllers/AttendanceController.dart';
import 'package:kota_106/Controllers/HistoryController.dart';
import 'package:sizer/sizer.dart';

import 'Attendance/Attendance/OfficePresensi.dart';
import 'Attendance/Attendance/RemoteWorking.dart';

class AttendanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // LoginModel user = Get.put(LoginModel());
    print("ukuran ${8.sp} ");
    print("ukuran ${7.sp} ");
    print("ukuran ${0.5.h} ");
    HistoryController historyAttendanceController =
        Get.put(HistoryController());
    AttendanceController attendanceController = Get.put(AttendanceController());
    attendanceController.getLocationPermission();
    var _selectedIndex = 0.obs;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Attendance",
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 20.sp,
                    color: Colors.black),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      width: 89.w,
                      height: 11.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/BackgroundCard.jpg'),
                              fit: BoxFit.fill)),
                      child: Column(children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/akun.png'),
                          ),
                          title: Text(
                            attendanceController.getName() ?? "Rafi Ramdani",
                            style: TextStyle(fontSize: 12.sp),
                          ),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.domain),
                                  Text(
                                    '  CV Garuda Inifity Kreasindo',
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Colors.black.withOpacity(0.6)),
                                  ),
                                ],
                              ),
                              Row(children: [
                                Icon(Icons.work_outline),
                                Text(
                                  attendanceController.getPosition() ??
                                      "  Junior Proggrammer",
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                              ])
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 32.w,
                        height: 32.w,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/BackgroundCard.jpg'),
                                    fit: BoxFit.fill)),
                            child: ListTile(
                              title: Column(
                                children: [
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Text(
                                    'Remote Working',
                                    style: TextStyle(fontSize: 8.sp),
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Icon(
                                    Icons.home_outlined,
                                    size: 25.sp,
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Container(
                                    width: 20.w,
                                    height: 4.h,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        15.0)),
                                            elevation: 10,
                                            primary: HexColor("363636")),
                                        onPressed: () async {
                                          await showModalBottomSheet(
                                              context: context,
                                              builder:
                                                  (BuildContext context) {
                                                return RemoteScreen();
                                              });
                                        },
                                        child: Text(
                                          "Open",
                                          style: TextStyle(
                                              fontFamily: "Roboto",
                                              fontSize: 8.sp,
                                              color: Colors.white),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 32.w,
                        height: 32.w,
                        child: Card(
                          elevation: 15,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/BackgroundCard.jpg'),
                                    fit: BoxFit.fill)),
                            child: ListTile(
                              title: Column(
                                children: [
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Text(
                                    'Office Working',
                                    style: TextStyle(
                                      fontSize: 8.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Icon(
                                    Icons.domain_outlined,
                                    size: 25.sp,
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Container(
                                    width: 20.w,
                                    height: 4.h,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        15.0)),
                                            elevation: 10,
                                            primary: HexColor("363636")),
                                        onPressed: () {
                                          // controller.scanQR(context);
                                          showModalBottomSheet(
                                              context: context,
                                              builder:
                                                  (BuildContext context) {
                                                return OfficePresensiPage();
                                              });
                                        },
                                        child: Text(
                                          "Open",
                                          style: TextStyle(
                                              fontFamily: "Roboto",
                                              fontSize: 8.sp,
                                              color: Colors.white),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 32.w,
                        height: 32.w,
                        child: Card(
                          elevation: 15,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/BackgroundCard.jpg'),
                                    fit: BoxFit.fill)),
                            child: ListTile(
                              title: Column(
                                children: [
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Text(
                                    'Activity Record',
                                    style: TextStyle(
                                        fontSize: 8.sp),
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Icon(
                                    Icons.videocam_outlined,
                                    size: 25.sp,
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Container(
                                    width: 20.w,
                                    height: 4.h,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        15.0)),
                                            elevation: 10,
                                            primary: HexColor("363636")),
                                        onPressed: () {
                                          Get.toNamed('/activityRecord');
                                        },
                                        child: Text(
                                          "Open",
                                          style: TextStyle(
                                              fontFamily: "Roboto",
                                              fontSize: 8.sp,
                                              color: Colors.white),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      width: 89.w,
                      height: 15.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/BottomCard.png'),
                              alignment: Alignment.bottomCenter,
                              fit: BoxFit.fitWidth)),
                      child: Column(children: [
                        SizedBox(
                          height: 1.sp,
                        ),
                        ListTile(
                          title: Text(
                            'Overtime',
                            style: TextStyle(fontSize: 10.sp),
                          ),
                          subtitle: Column(
                            children: [
                              Text(
                                'fill in the form and your overtime request will be approved by HR/Admin.',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6),
                                    fontSize: 9.sp),
                              ),
                              Container(
                                alignment: Alignment.bottomRight,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0)),
                                        elevation: 10,
                                        primary: HexColor("363636")),
                                    onPressed: () {},
                                    child: Text(
                                      "Start Overtime",
                                      style: TextStyle(
                                          fontFamily: "Roboto",
                                          fontSize: 10.sp,
                                          color: Colors.white),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      width: 89.w,
                      height: 15.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/BottomCard.png'),
                              alignment: Alignment.bottomCenter,
                              fit: BoxFit.fitWidth)),
                      child: Column(children: [
                        SizedBox(
                          height: 1.sp,
                        ),
                        ListTile(
                          title: Text(
                            'Leave',
                            style: TextStyle(
                              fontSize: 10.sp,
                            ),
                          ),
                          subtitle: Center(
                            child: Column(
                              children: [
                                Text(
                                  'fill in the form and your leave request will be approved by HR/Admin.',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6),
                                      fontSize: 9.sp),
                                ),
                                Container(
                                  alignment: Alignment.bottomRight,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      15.0)),
                                          elevation: 10,
                                          primary: HexColor("363636")),
                                      onPressed: () {
                                        Get.toNamed('/leaveScreen');
                                      },
                                      child: Text(
                                        "Apply for Leave",
                                        style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontSize: 10.sp,
                                            color: Colors.white),
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      width: 89.w,
                      height: 15.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/BottomCard.png'),
                              alignment: Alignment.bottomCenter,
                              fit: BoxFit.fitWidth)),
                      child: Column(children: [
                        SizedBox(
                          height: 1.sp,
                        ),
                        ListTile(
                          title: Text(
                            'Permit',
                            style: TextStyle(fontSize: 10.sp),
                          ),
                          subtitle: Center(
                            child: Column(
                              children: [
                                Text(
                                  'fill in the form and your permit request will be approved by HR/Admin.',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6),
                                      fontSize: 9.sp),
                                ),
                                Container(
                                  alignment: Alignment.bottomRight,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      15.0)),
                                          elevation: 10,
                                          primary: HexColor("363636")),
                                      onPressed: () {},
                                      child: Text(
                                        "Apply for Permit",
                                        style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontSize: 10.sp,
                                            color: Colors.white),
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.fingerprint_outlined,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "")
        ],
        currentIndex: _selectedIndex.value,
        onTap: (index) {
          if (index == 0) {
            _selectedIndex.value = index;
            Get.toNamed('/');
          } else if (index == 1) {
            historyAttendanceController.getHistoryAttendance();
            _selectedIndex.value = index;
            Get.toNamed('/historyPage');
          } else if (index == 2) {
            _selectedIndex.value = index;
            Get.toNamed('/profileScreen');
          }
        },
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
