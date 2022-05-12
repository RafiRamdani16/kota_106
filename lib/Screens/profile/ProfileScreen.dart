import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:kota_106/Controllers/ProfileController.dart';


class ProfileScreen extends GetView<ProfileController> {
  

  Widget bottomNavigationBar(){
    return BottomNavigationBar(
        iconSize: 30,
        backgroundColor: Colors.black,
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
              icon: Icon(Icons.person),
              label: "profile",
              backgroundColor: Colors.black)
        ],
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            Get.toNamed('/');
          } else if (index == 1) {
            Get.toNamed('/historyPage');
          } else if (index == 2) {
            Get.toNamed('/profilePage');
          }
        },
        selectedItemColor: Colors.amber,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      );
  }

  Scaffold errorView(BuildContext context) { 
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 40),
            child: IconButton(
                onPressed: () {
                  controller.logout();
                },
                icon: Icon(
                  Icons.exit_to_app,
                  size: 40,
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
            height: Get.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/BackgroundProfile.jpg"),
                    fit: BoxFit.fill)),
            child: Center(
              child: Text(
                "Terjadi Kesalahan Silahkan Kembali",
                style: TextStyle(fontSize: 16),
              ),
            )),
      ),
      bottomNavigationBar: bottomNavigationBar() ,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.getProfile(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return waitingView(context);
        } else {
          if (snapshot.hasError)
            return errorView(context);
          else
            return displayProfile(context);
        }
      },
    );
  }

  Scaffold waitingView(BuildContext context) {
    
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 35),
            child: IconButton(
                onPressed: () {
                  controller.logout();
                },
                icon: Icon(
                  Icons.exit_to_app,
                  size: 40,
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/BackgroundProfile.jpg"),
                    fit: BoxFit.fill)),
            child: Center(child: CircularProgressIndicator())),
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  Scaffold displayProfile(BuildContext context) {
    
    double fontSize = 10.0;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 40),
            child: IconButton(
                onPressed: () {
                  controller.logout();
                },
                icon: Icon(
                  Icons.exit_to_app,
                  size: 40,
                )),
          )
        ],
      ),
      body: Container(
        height: Get.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/BackgroundProfile.jpg"),
                fit: BoxFit.fill)),
        child: Padding(
          padding: EdgeInsets.only(top: 45),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage("https://bbbe-2001-448a-304c-3893-1d52-5ff3-6470-a748.ngrok.io/${controller.photoName}"),
                  radius: 70,
                ),
                // SizedBox(
                //   height: 20,
                // ),
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
                          height: 50,
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
                  height: 50,
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
      ),
      bottomNavigationBar: bottomNavigationBar()
    );
  }
}
