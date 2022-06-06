import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import 'package:kota_106/Controllers/ProfileController.dart';

class ProfileScreen extends GetView<ProfileController> {
  Widget bottomNavigationBar() {
    return BottomNavigationBar(
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
      currentIndex: 2,
      onTap: (index) {
        if (index == 0) {
          Get.toNamed('/');
        } else if (index == 1) {
          Get.toNamed('/historyScreen');
        } else if (index == 2) {
          Get.toNamed('/profileScreen');
        }
      },
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.white,
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
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  Container topProfile() {
    return Container(
      height: 30.h,
      width: Get.width,
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/testingSelfiePhoto.jpg"),
            radius: 7.h,
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            controller.name.text,
            style: TextStyle(fontSize: 14.sp),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            controller.position.text,
            style: TextStyle(fontSize: 12.sp),
            textAlign: TextAlign.center,
          ),
        ],
      ),
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
            return profile();
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

  Container downProfile() {
    double fontSize = 12.sp;
    double headFontSize = 14.sp;
    return Container(
        padding: EdgeInsets.only(left: 5.w, right: 5.w),
        height: 48.h,
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Employee ID',
                style: TextStyle(fontFamily: 'Roboto', fontSize: headFontSize),
              ),
              Container(
                width: Get.width,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: TextFormField(
                  enabled: false,
                  decoration:
                      InputDecoration(fillColor: Colors.white, filled: true),
                  style: TextStyle(fontSize: fontSize),
                  maxLines: 1,
                  controller: controller.employeeId,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                'Join Date',
                style: TextStyle(fontFamily: 'Roboto', fontSize: headFontSize),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Container(
                width: Get.width,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: TextFormField(
                  enabled: false,
                  decoration:
                      InputDecoration(fillColor: Colors.white, filled: true),
                  style: TextStyle(fontSize: fontSize),
                  maxLines: 1,
                  controller: controller.joinDate,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                'Email',
                style: TextStyle(fontFamily: 'Roboto', fontSize: headFontSize),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Container(

                width: Get.width,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: TextFormField(
                  enabled: false,
                  decoration:
                      InputDecoration(fillColor: Colors.white, filled: true),
                  style: TextStyle(fontSize: fontSize),
                  maxLines: 1,
                  controller: controller.email,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                'No KTP',
                style: TextStyle(fontFamily: 'Roboto', fontSize: headFontSize),
              ),
              Container(
                width: Get.width,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: TextFormField(
                  enabled: false,
                  decoration:
                      InputDecoration(fillColor: Colors.white, filled: true),
                  style: TextStyle(fontSize: fontSize),
                  maxLines: 1,
                  controller: controller.noKTP,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                'NPWP',
                style: TextStyle(fontFamily: 'Roboto', fontSize: headFontSize),
              ),
              Container(
                width: Get.width,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: TextFormField(
                  enabled: false,
                  decoration:
                      InputDecoration(fillColor: Colors.white, filled: true),
                  style: TextStyle(fontSize: fontSize),
                  maxLines: 1,
                  controller: controller.npwp,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                'Religion',
                style: TextStyle(fontFamily: 'Roboto', fontSize: headFontSize),
              ),
              Container(
                width: Get.width,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: TextFormField(
                  enabled: false,
                  decoration:
                      InputDecoration(fillColor: Colors.white, filled: true),
                  style: TextStyle(fontSize: fontSize),
                  maxLines: 1,
                  controller: controller.religion,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                'Status',
                style: TextStyle(fontFamily: 'Roboto', fontSize: headFontSize),
              ),
              Container(
                width: Get.width,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: TextFormField(
                  enabled: false,
                  decoration:
                      InputDecoration(fillColor: Colors.white, filled: true),
                  style: TextStyle(fontSize: fontSize),
                  maxLines: 1,
                  controller: controller.status,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                'End Date',
                style: TextStyle(fontFamily: 'Roboto', fontSize: headFontSize),
              ),
              Container(
                width: Get.width,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: TextFormField(
                  enabled: false,
                  decoration:
                      InputDecoration(fillColor: Colors.white, filled: true),
                  style: TextStyle(fontSize: fontSize),
                  maxLines: 1,
                  controller: controller.endDate,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                'Phone Number',
                style: TextStyle(fontFamily: 'Roboto', fontSize: headFontSize),
              ),
              Container(
                width: Get.width,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: TextFormField(
                  enabled: false,
                  decoration:
                      InputDecoration(fillColor: Colors.white, filled: true),
                  style: TextStyle(fontSize: fontSize),
                  maxLines: 1,
                  controller: controller.phoneNumber,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                'City',
                style: TextStyle(fontFamily: 'Roboto', fontSize: headFontSize),
              ),
              Container(
                width: Get.width,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: TextFormField(
                  enabled: false,
                  decoration:
                      InputDecoration(fillColor: Colors.white, filled: true),
                  style: TextStyle(fontSize: fontSize),
                  maxLines: 1,
                  controller: controller.city,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                'Date of Birth',
                style: TextStyle(fontFamily: 'Roboto', fontSize: headFontSize),
              ),
              Container(
                width: Get.width,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: TextFormField(
                  enabled: false,
                  decoration:
                      InputDecoration(fillColor: Colors.white, filled: true),
                  style: TextStyle(fontSize: fontSize),
                  maxLines: 1,
                  controller: controller.dateOfBirth,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                'Address',
                style: TextStyle(fontFamily: 'Roboto', fontSize: headFontSize),
              ),
              Container(
                width: Get.width,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: TextFormField(
                    enabled: false,
                    decoration:
                        InputDecoration(fillColor: Colors.white, filled: true),
                    style: TextStyle(fontSize: fontSize),
                    maxLines: 4,
                    controller: controller.address),
              ),
             
            ],
          ),
        ));
  }

  Scaffold profile() {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 5.w),
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
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/BackgroundProfile.jpg"),
                fit: BoxFit.fill)),
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            topProfile(),
            SizedBox(
              height: 1.h,
            ),
            downProfile(),
            SizedBox(
              height: 2.h,
            ),
            Container(
              width: 90.w,
              height: 5.h,
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
                        fontSize: 12.sp,
                        color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }
}
