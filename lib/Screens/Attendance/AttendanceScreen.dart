import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kota_106/Controllers/AttendanceController.dart';
import 'package:kota_106/Controllers/HistoryController.dart';


import 'Attendance/OfficePresensi.dart';
import 'Attendance/RemotePresensi.dart';

class AttendanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // LoginModel user = Get.put(LoginModel());
  
    HistoryController historyAttendanceController =
        Get.put(HistoryController());
    AttendanceController attendanceController = Get.put(AttendanceController());
    attendanceController.getPermission();
    var _selectedIndex = 0.obs;
    return AspectRatio(
      aspectRatio: 100 / 100,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Center(
            child: SingleChildScrollView(
              child: Wrap(
                direction: Axis.vertical,
                spacing: 10,
                runSpacing: 10,
                children: [
                  Text(
                    "Attendance",
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 26,
                        color: Colors.black),
                  ),
                  Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      width: 340,
                      height: 80,
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
                          title: Text("terjadi kesalahan" ),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.domain),
                                  Text(
                                    'CV Garuda Inifity Kreasindo',
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6)),
                                  ),
                                ],
                              ),
                              Row(children: [
                                Icon(Icons.work_outline),
                                Text(
                                   "terjadi kesalahan" ,
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                              ])
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          width: 110,
                          height: 120,
                          child: Card(
                            elevation: 15,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/BackgroundCard.jpg'),
                                      fit: BoxFit.fill)),
                              child: ListTile(
                                title: Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        'Remote Working',
                                        style: TextStyle(
                                            fontSize: 9, fontFamily: 'Roboto'),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(bottom: 5.0)),
                                      Icon(
                                        Icons.home_outlined,
                                        size: 30,
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(bottom: 5.0)),
                                      Container(
                                        width: 80,
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
                                                    return RemotePresensiPage();
                                                  });
                                            },
                                            child: Text(
                                              "Open",
                                              style: TextStyle(
                                                  fontFamily: "Roboto",
                                                  fontSize: 10,
                                                  color: Colors.white),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          width: 110,
                          height: 120,
                          child: Card(
                            elevation: 15,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/BackgroundCard.jpg'),
                                      fit: BoxFit.fill)),
                              child: ListTile(
                                title: Column(
                                  children: [
                                    Text(
                                      'Office Working',
                                      style: TextStyle(
                                          fontSize: 10, fontFamily: 'Roboto'),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5.0)),
                                    Icon(
                                      Icons.domain_outlined,
                                      size: 30,
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5.0)),
                                    Container(
                                      width: 80,
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
                                                builder: (BuildContext context) {
                                                  return OfficePresensiPage();
                                                });
                                          },
                                          child: Text(
                                            "Open",
                                            style: TextStyle(
                                                fontFamily: "Roboto",
                                                fontSize: 10,
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
                          width: 110,
                          height: 120,
                          child: Card(
                            elevation: 15,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/BackgroundCard.jpg'),
                                      fit: BoxFit.fill)),
                              child: ListTile(
                                title: Column(
                                  children: [
                                    Text(
                                      'Activity Record',
                                      style: TextStyle(
                                          fontSize: 10, fontFamily: 'ROBOTO'),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5.0)),
                                    Icon(
                                      Icons.videocam_outlined,
                                      size: 30,
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5.0)),
                                    Container(
                                      width: 80,
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
                                                fontSize: 10,
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
                  ),
                  Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      width: 340,
                      height: 105,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/BackgroundCard.jpg'),
                              fit: BoxFit.fill)),
                      child: Column(children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        ListTile(
                          title: const Text('Overtime'),
                          subtitle: Center(
                            child: Column(
                              children: [
                                Text(
                                  'fill in the form and your overtime request will be approved by HR/Admin.',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6),
                                      fontSize: 11),
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
                                            fontSize: 10,
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
                  Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      width: 340,
                      height: 105,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/BackgroundCard.jpg'),
                              fit: BoxFit.fill)),
                      child: Column(children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        ListTile(
                          title: const Text('Leave'),
                          subtitle: Center(
                            child: Column(
                              children: [
                                Text(
                                  'fill in the form and your leave request will be approved by HR/Admin.',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6),
                                      fontSize: 10),
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
                                        "Apply for Leave",
                                        style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontSize: 10,
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
                  Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      width: 340,
                      height: 105,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/BackgroundCard.jpg'),
                              fit: BoxFit.fill)),
                      child: Column(children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        ListTile(
                          title: const Text('Permit'),
                          subtitle: Center(
                            child: Column(
                              children: [
                                Text(
                                  'fill in the form and your permit request will be approved by HR/Admin.',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6),
                                      fontSize: 11),
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
                                        "Apply for Permit",
                                        style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontSize: 10,
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
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.fingerprint_outlined),
                label: "home",
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_time_outlined),
                label: "histori",
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.announcement),
                label: "announcement",
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                label: "profile",
                backgroundColor: Colors.black)
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
            } else if (index == 3) {
              _selectedIndex.value = index;
              Get.toNamed('/profileScreen');
            }
          },
          selectedItemColor: Colors.amber,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
    );
  }
}
