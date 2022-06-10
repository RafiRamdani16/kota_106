import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kota_106/Controllers/ActivityRecordController.dart';
import 'package:sizer/sizer.dart';

class ActivityRecordScreen extends GetView<ActivityRecordController> {
  @override
  Widget build(BuildContext context) {
    
    controller.getLocation();
    controller.dateTimeNow();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: HexColor('FCBC45'),
        automaticallyImplyLeading: false,
        title: const Text(
          'Activity Record',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/BackgroundProfile.jpg"),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: EdgeInsets.only(top: 5.h, left: 5.w, right: 5.w),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 15,
                    child: Padding(
                      padding: EdgeInsets.all(5.w),
                      child: Container(
                        height: 70.h,
                        width: Get.width,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('Date',
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Roboto",
                                      )),
                                  Padding(padding: EdgeInsets.only(left: 160)),
                                  Text('Time',
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Roboto",
                                      ))
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 100,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          fillColor: Colors.white,
                                          filled: true),
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 12),
                                      maxLines: 1,
                                      controller: controller.dateNow,
                                      enabled: false,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 80.0,
                                  ),
                                  Container(
                                    width: 100.0,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          filled: true,
                                          fillColor: Colors.white),
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                      maxLines: 1,
                                      controller: controller.timeNow,
                                      enabled: false,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('Location',
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Roboto",
                                  )),
                              Padding(padding: EdgeInsets.only(top: 10)),
                              TextFormField(
                                decoration: InputDecoration(
                                    fillColor: Colors.white, filled: true),
                                maxLines: 2,
                                controller: controller.locationNow,
                                enabled: false,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('Description...',
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Roboto",
                                  )),
                              TextFormField(
                                decoration: InputDecoration(
                                    fillColor: Colors.white, filled: true),
                                style: TextStyle(fontSize: 12),
                                maxLines: 4,
                                controller: controller.taskList,
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text('Photo',
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Roboto",
                                  )),
                              Row(
                                children: [
                                  Obx((() {
                                    return controller.setImageView();
                                  })),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0)),
                                          primary: HexColor('FFC368')),
                                      onPressed: () {
                                        controller.openCamera();
                                      },
                                      child: Text(
                                        'Add Photo',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.black),
                                      )),
                                ],
                              ),
                            ]),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    width: 90.w,
                    height: 4.h,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            elevation: 10,
                            primary: HexColor("363636")),
                        onPressed: () {
                          controller.activityRecordForm(
                              controller.taskList.text,
                              controller.photoSelfie.value);
                        },
                        child: Text(
                          "New Activity",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 14.sp,
                              color: Colors.white),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
