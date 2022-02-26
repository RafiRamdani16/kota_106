import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kota_106/Controllers/LoginController.dart';

import '../../Models/LoginModel.dart';
import 'Presensi/OfficePresensi.dart';
import 'Presensi/RemotePresensi.dart';

class AttendanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // LoginModel user = Get.put(LoginModel());
    LoginController controller = Get.put(LoginController());
    var _selectedIndex = 0.obs;
    var screenHeightSize = MediaQuery.of(context).size.height;
    var screenWidthSize = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.only(top: screenHeightSize / 10, left: 10, right: 10),
        child: SingleChildScrollView(
          child: Center(
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                Text(
                  "Attendance",
                  style: TextStyle(
                      fontFamily: "Roboto", fontSize: 26, color: Colors.black),
                ),
                Obx(() {
                  return Card(
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
                          title: Text(controller.name.value),
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
                                  controller.position.value,
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                              ])
                            ],
                          ),
                        ),
                      ]),
                    ),
                  );
                }),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      width: screenWidthSize / 2 - 10,
                      height: 100,
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
                                Row(
                                  children: [
                                    Icon(Icons.home_outlined),
                                    Text(
                                      'Remote Working',
                                      style: TextStyle(
                                          fontSize: 14, fontFamily: 'ROBOTO'),
                                    )
                                  ],
                                ),
                                Container(
                                  width: screenWidthSize / 4,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0)),
                                          elevation: 10,
                                          primary: HexColor("363636")),
                                      onPressed: () async {
                                        await showModalBottomSheet(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return RemotePresensiPage();
                                            });
                                      },
                                      child: Text(
                                        "Open",
                                        style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontSize: 16,
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
                      alignment: Alignment.centerRight,
                      width: screenWidthSize / 2 - 10,
                      height: 100,
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
                                Row(
                                  children: [
                                    Icon(Icons.domain_outlined),
                                    Text(
                                      'Office Working',
                                      style: TextStyle(
                                          fontSize: 14, fontFamily: 'ROBOTO'),
                                    )
                                  ],
                                ),
                                Container(
                                  width: screenWidthSize / 4,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0)),
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
                                            fontSize: 16,
                                            color: Colors.white),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
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
                            image:
                                AssetImage('assets/images/BackgroundCard.jpg'),
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
                                          fontSize: 14,
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
                            image:
                                AssetImage('assets/images/BackgroundCard.jpg'),
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
                                      "Start Leave",
                                      style: TextStyle(
                                          fontFamily: "Roboto",
                                          fontSize: 16,
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
                            image:
                                AssetImage('assets/images/BackgroundCard.jpg'),
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
                                    color: Colors.black, fontSize: 11),
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
                                      "Start Permit",
                                      style: TextStyle(
                                          fontFamily: "Roboto",
                                          fontSize: 16,
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
                            image:
                                AssetImage('assets/images/BackgroundCard.jpg'),
                            fit: BoxFit.fill)),
                    child: Column(children: [
                      Padding(padding: EdgeInsets.only(left: 10)),
                      ListTile(
                        title: const Text('Reimburse'),
                        subtitle: Center(
                          child: Column(
                            children: [
                              Text(
                                'fill in the form and your reimburse request will be approved by HR/Admin.',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 11),
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
                                      "Start Reimburse",
                                      style: TextStyle(
                                          fontFamily: "Roboto",
                                          fontSize: 16,
                                          color: Colors.white),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                )
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
            _selectedIndex.value = index;
            Get.toNamed('/historyPage');
          } else if (index == 2) {
            _selectedIndex.value = index;
          } else if (index == 3) {
            _selectedIndex.value = index;
            Get.toNamed('/profilePage');
          }
        },
        selectedItemColor: Colors.amber,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
