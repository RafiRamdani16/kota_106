import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:kota_106/Controllers/ProfileController.dart';

import '../../Controllers/Authentication.dart';

class ProfileScreen extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    double fontSize = 10.0;
    AuthenticationManager authenticationManager =
        Get.put(AuthenticationManager());
    var _selectedIndex = 3.obs;
    controller.getProfile();

    return AspectRatio(
      aspectRatio: 100 / 100,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 40),
              child: IconButton(
                  onPressed: () {
                    authenticationManager.logout();
                    
                  },
                  icon: Icon(
                    Icons.exit_to_app,
                    size: 40,
                  )),
            )
          ],
        ),
        body: controller.isLoading.value ==
            false? SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/BackgroundProfile.jpg"),
                    fit: BoxFit.fill)),
            child: Padding(
              padding: EdgeInsets.only(top: 45),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage("https://picsum.photos/200"),
                    radius: 70,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    controller.name.text,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    controller.position.text,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Wrap(
                    spacing: 5,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        direction: Axis.vertical,
                        children: [
                          Text(
                            'Employee ID',
                            style: TextStyle(
                                fontFamily: 'Roboto', fontSize: fontSize),
                          ),
                          Container(
                            height: 40,
                            width: 147,
                            child: TextFormField(
                              enabled: false,
                              decoration: InputDecoration(
                                  fillColor: Colors.white, filled: true),
                              style: TextStyle(fontSize: fontSize),
                              maxLines: 4,
                              controller: controller.employeeId,
                            ),
                          ),
                          Text(
                            'Join Date',
                            style: TextStyle(
                                fontFamily: 'Roboto', fontSize: fontSize),
                          ),
                          Container(
                            height: 40,
                            width: 147,
                            child: TextFormField(
                              enabled: false,
                              decoration: InputDecoration(
                                  fillColor: Colors.white, filled: true),
                              style: TextStyle(fontSize: fontSize),
                              maxLines: 4,
                              controller: controller.joinDate,
                            ),
                          ),
                          Text(
                            'Email',
                            style: TextStyle(
                                fontFamily: 'Roboto', fontSize: fontSize),
                          ),
                          Container(
                            height: 40,
                            width: 147,
                            child: TextFormField(
                              enabled: false,
                              decoration: InputDecoration(
                                  fillColor: Colors.white, filled: true),
                              style: TextStyle(fontSize: fontSize),
                              maxLines: 4,
                              controller: controller.email,
                            ),
                          ),
                          Text(
                            'No KTP',
                            style: TextStyle(
                                fontFamily: 'Roboto', fontSize: fontSize),
                          ),
                          Container(
                            height: 40,
                            width: 147,
                            child: TextFormField(
                              enabled: false,
                              decoration: InputDecoration(
                                  fillColor: Colors.white, filled: true),
                              style: TextStyle(fontSize: fontSize),
                              maxLines: 4,
                              controller: controller.noKTP,
                            ),
                          ),
                          Text(
                            'NPWP',
                            style: TextStyle(
                                fontFamily: 'Roboto', fontSize: fontSize),
                          ),
                          Container(
                            height: 40,
                            width: 147,
                            child: TextFormField(
                              enabled: false,
                              decoration: InputDecoration(
                                  fillColor: Colors.white, filled: true),
                              style: TextStyle(fontSize: fontSize),
                              maxLines: 4,
                              controller: controller.npwp,
                            ),
                          ),
                          Text(
                            'Religion',
                            style: TextStyle(
                                fontFamily: 'Roboto', fontSize: fontSize),
                          ),
                          Container(
                            height: 40,
                            width: 147,
                            child: TextFormField(
                              enabled: false,
                              decoration: InputDecoration(
                                  fillColor: Colors.white, filled: true),
                              style: TextStyle(fontSize: fontSize),
                              maxLines: 4,
                              controller: controller.religion,
                            ),
                          ),
                        ],
                      ),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        direction: Axis.vertical,
                        children: [
                          Text(
                            'Status',
                            style: TextStyle(
                                fontFamily: 'Roboto', fontSize: fontSize),
                          ),
                          Container(
                            height: 40,
                            width: 147,
                            child: TextFormField(
                              enabled: false,
                              decoration: InputDecoration(
                                  fillColor: Colors.white, filled: true),
                              style: TextStyle(fontSize: fontSize),
                              maxLines: 4,
                              controller: controller.status,
                            ),
                          ),
                          Text(
                            'End Date',
                            style: TextStyle(
                                fontFamily: 'Roboto', fontSize: fontSize),
                          ),
                          Container(
                            height: 40,
                            width: 147,
                            child: TextFormField(
                              enabled: false,
                              decoration: InputDecoration(
                                  fillColor: Colors.white, filled: true),
                              style: TextStyle(fontSize: fontSize),
                              maxLines: 4,
                              controller: controller.endDate,
                            ),
                          ),
                          Text(
                            'Phone Number',
                            style: TextStyle(
                                fontFamily: 'Roboto', fontSize: fontSize),
                          ),
                          Container(
                            height: 40,
                            width: 147,
                            child: TextFormField(
                              enabled: false,
                              decoration: InputDecoration(
                                  fillColor: Colors.white, filled: true),
                              style: TextStyle(fontSize: fontSize),
                              maxLines: 4,
                              controller: controller.phoneNumber,
                            ),
                          ),
                          Text(
                            'City',
                            style: TextStyle(
                                fontFamily: 'Roboto', fontSize: fontSize),
                          ),
                          Container(
                            height: 40,
                            width: 147,
                            child: TextFormField(
                              enabled: false,
                              decoration: InputDecoration(
                                  fillColor: Colors.white, filled: true),
                              style: TextStyle(fontSize: fontSize),
                              maxLines: 4,
                              controller: controller.city,
                            ),
                          ),
                          Text(
                            'Date of Birth',
                            style: TextStyle(
                                fontFamily: 'Roboto', fontSize: fontSize),
                          ),
                          Container(
                            height: 40,
                            width: 147,
                            child: TextFormField(
                              enabled: false,
                              decoration: InputDecoration(
                                  fillColor: Colors.white, filled: true),
                              style: TextStyle(fontSize: fontSize),
                              maxLines: 4,
                              controller: controller.dateOfBirth,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Address',
                    style: TextStyle(fontFamily: 'Roboto', fontSize: fontSize),
                  ),
                  Container(
                    height: 40,
                    width: 324,
                    child: TextFormField(
                        enabled: false,
                        decoration: InputDecoration(
                            fillColor: Colors.white, filled: true),
                        style: TextStyle(fontSize: 12),
                        maxLines: 4,
                        controller: controller.address),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 350,
                    height: 40,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            elevation: 10,
                            primary: HexColor("363636")),
                        onPressed: () {
                          Get.toNamed('/editProfileScreen');
                        },
                        child: Text(
                          "Edit Data",
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
        ):CircularProgressIndicator(),
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
      ),
    );
  }
}
