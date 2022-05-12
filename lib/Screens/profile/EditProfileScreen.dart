// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kota_106/Controllers/ProfileController.dart';

class EditProfileScreen extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    var screenHeightSize = MediaQuery.of(context).size.height;
    var screenWidthSize = MediaQuery.of(context).size.width;
    double fontSize = 10.0;
    var _selectedIndex = 2.obs;
    return AspectRatio(
      aspectRatio: 100 / 100,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor('FCBC45'),
          elevation: 0,
          automaticallyImplyLeading: false,
          title: const Text(
            'Edit Data Employee',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Get.toNamed('/profileScreen');
            },
          ),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/BackgroundProfile.jpg"),
                  fit: BoxFit.fill)),
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: SingleChildScrollView(
              child: Row(
                children: [
                  Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      height: screenHeightSize - 150,
                      width: screenWidthSize,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
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
                                    'Name',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: fontSize),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 147,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true),
                                      style: TextStyle(fontSize: fontSize),
                                      maxLines: 4,
                                      controller: controller.name,
                                    ),
                                  ),
                                  Text(
                                    'Employee ID',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: fontSize),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 147,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true),
                                      style: TextStyle(fontSize: fontSize),
                                      maxLines: 4,
                                      enabled: false,
                                      controller: controller.employeeId,
                                    ),
                                  ),
                                  Text(
                                    'Join Date',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: fontSize),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 147,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true),
                                      style: TextStyle(fontSize: fontSize),
                                      maxLines: 4,
                                      enabled: false,
                                      controller: controller.joinDate,
                                    ),
                                  ),
                                  Text(
                                    'Email',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: fontSize),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 147,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true),
                                      style: TextStyle(fontSize: fontSize),
                                      maxLines: 4,
                                      keyboardType: TextInputType.emailAddress,
                                      controller: controller.email,
                                    ),
                                  ),
                                  Text(
                                    'No KTP',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: fontSize),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 147,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true),
                                      style: TextStyle(fontSize: fontSize),
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(16),
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      controller: controller.noKTP,
                                    ),
                                  ),
                                  Text(
                                    'NPWP',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: fontSize),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 147,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true),
                                      style: TextStyle(fontSize: fontSize),
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(15),
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      controller: controller.npwp,
                                    ),
                                  ),
                                  Text(
                                    'Religion',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: fontSize),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 147,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true),
                                      style: TextStyle(fontSize: fontSize),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            '[a-zA-Z]')
                                      ],
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
                                    'Position',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: fontSize),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 147,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true),
                                      style: TextStyle(fontSize: fontSize),
                                      enabled: false,
                                      controller: controller.position,
                                    ),
                                  ),
                                  Text(
                                    'Status',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: fontSize),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 147,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true),
                                      style: TextStyle(fontSize: fontSize),
                                      enabled: false,
                                      controller: controller.status,
                                    ),
                                  ),
                                  Text(
                                    'End Date',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: fontSize),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 147,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true),
                                      style: TextStyle(fontSize: fontSize),
                                      enabled: false,
                                      controller: controller.endDate,
                                    ),
                                  ),
                                  Text(
                                    'Phone Number',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: fontSize),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 147,
                                    child: TextFormField(
                                      
                                      validator: (value) {
                                        if (value == "") {
                                          return "Phone Number Can't Be Empty";
                                        } else if (value!.length < 11) {
                                          return "Phone Number Cannot Be Less Than 11 Digits";
                                        }
                                      },
                                      decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true),
                                      style: TextStyle(fontSize: fontSize),
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(13),
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      controller: controller.phoneNumber,
                                    ),
                                  ),
                                  Text(
                                    'City',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: fontSize),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 147,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true),
                                      style: TextStyle(fontSize: fontSize),
                                      validator: (value) {
                                        if (value == "") {
                                          return "City can't be empty";
                                        }
                                      },
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            '[a-zA-Z]')
                                      ],
                                      controller: controller.city,
                                    ),
                                  ),
                                  Text(
                                    'Date of Birth',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: fontSize),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 147,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true),
                                      style: TextStyle(fontSize: fontSize),
                                      readOnly: true,
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
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    width: 350,
                    height: 60,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            elevation: 10,
                            primary: HexColor("363636")),
                        onPressed: () {
                          controller.updateProfile();
                        },
                        child: Text(
                          "Save Data",
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
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          backgroundColor: Colors.black,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.fingerprint_outlined,
                  color: Colors.white,
                ),
                label: "home",
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_time_outlined),
                label: "histori",
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
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
              Get.toNamed('/profilePage');
            }
          },
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
    );
  }
}
