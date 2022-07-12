import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

import '../../AttendanceController.dart';

class CheckInOnlineScreen extends GetView<AttendanceController> {
  @override
  Widget build(BuildContext context) {
    controller.getLocation();
    controller.getDateTimeNow();
    return SingleChildScrollView(
      child: Center(
        child: Form(
          child: Container(
            color: HexColor('F5F5F5'),
            height: 85.h,
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(children: [
              Row(children: [
                Image.asset(
                  'assets/images/Icon/Location.png',
                  width: 40,
                  height: 40,
                ),
                Text('Check-in Location'),
              ]),
              Padding(padding: EdgeInsets.only(top: 10)),
              TextFormField(
                decoration:
                    InputDecoration(fillColor: Colors.white, filled: true),
                maxLines: 2,
                controller: controller.clocation,
                enabled: false,
              ),
              Row(children: [
                Image.asset(
                  'assets/images/Icon/Camera.png',
                  width: 40,
                  height: 40,
                ),
                Text('Check-in Photo'),
              ]),
              Row(
                children: [
                  Obx((() {
                    return controller.setImageView();
                  })),
                  ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Foto"),
                                content: Text("Upload Foto From..."),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        controller.openCamera();
                                      },
                                      child: Text(
                                        "Camera",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        controller.openGallery();
                                      },
                                      child: Text(
                                        "Gallery",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: Text(
                                        "Oke",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ))
                                ],
                              );
                            });
                      },
                      child: Text('Take Picture')),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Image.asset('assets/images/Icon/Calendar.png'),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text('Check-in Date'),
                  Padding(padding: EdgeInsets.only(left: 50)),
                  Image.asset('assets/images/Icon/Clock.png'),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text('Check-in Time')
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 45.0,
                  ),
                  Container(
                    width: 100,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.white,
                          filled: true),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                      maxLines: 1,
                      controller: controller.cDate,
                      enabled: false,
                    ),
                  ),
                  SizedBox(
                    width: 80.0,
                  ),
                  Container(
                    width: 80.0,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.white),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                      maxLines: 1,
                      controller: controller.cTime,
                      enabled: false,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset('assets/images/Icon/Note.png'),
                  Text('You Want To...'),
                ],
              ),
              TextFormField(
                decoration:
                    InputDecoration(fillColor: Colors.white, filled: true),
                style: TextStyle(fontSize: 12),
                maxLines: 4,
                controller: controller.taskList,
              ),
              Container(
                  width: Get.width - 20,
                  child: ElevatedButton(
                      onPressed: () {
                        controller.checkInOnlineForm(controller.taskList.text,
                            controller.photoName.value);
                      },
                      child: Text('Check-in Now')))
            ]),
          ),
        ),
      ),
    );
  }
}
