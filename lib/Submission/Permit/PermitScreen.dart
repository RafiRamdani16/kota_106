import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:kota_106/Submission/Permit/PermitController.dart';
import 'package:sizer/sizer.dart';

import '../DetailSubmissionAttachmentScreen.dart';

class PermitScreen extends GetView<PermitController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: HexColor('FCBC45'),
        automaticallyImplyLeading: false,
        title: Text(
          'Permit Form',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
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
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/BackgroundProfile.jpg"),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: SingleChildScrollView(
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
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        height: 80.h,
                        width: 335,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Date",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Obx((() {
                                return Container(
                                    width: 30.w,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 5, primary: Colors.white),
                                      onPressed: () {
                                        controller.permitDatePicker(context);
                                      },
                                      child: Text(
                                        DateFormat('yyyy-MM-dd').format(
                                            controller
                                                .permitSelectedDate.value),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11.sp),
                                      ),
                                    ));
                              })),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Start Time',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 40.w,
                                  ),
                                  Text('End Time',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                              Row(
                                children: [
                                  Obx(() {
                                    return Container(
                                        width: 25.w,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              elevation: 5,
                                              primary: Colors.white),
                                          onPressed: () {
                                            controller
                                                .permitTimePicker(context);
                                          },
                                          child: Column(
                                            children: [
                                              Text(
                                                  "${controller.permitStartTime.value.hour}:${controller.permitStartTime.value.minute}",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 11.sp)),
                                            ],
                                          ),
                                        ));
                                  }),
                                  SizedBox(
                                    width: 30.w,
                                  ),
                                  Obx(() {
                                    return Container(
                                        width: 25.w,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              elevation: 5,
                                              primary: Colors.white),
                                          onPressed: () {
                                            controller
                                                .permitTimePicker(context);
                                          },
                                          child: Column(
                                            children: [
                                              Text(
                                                "${controller.permitEndTime.value.hour}:${controller.permitEndTime.value.minute}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 11.sp),
                                              ),
                                            ],
                                          ),
                                        ));
                                  }),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text('Description',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold)),
                              Padding(padding: EdgeInsets.only(top: 10)),
                              TextFormField(
                                decoration: InputDecoration(
                                    fillColor: Colors.white, filled: true),
                                maxLines: 2,
                                controller: controller.permitDescription,
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                children: [
                                  Text("Attachment",
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0)),
                                          primary: HexColor('FFC368')),
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text("Attachment"),
                                                content: Text(
                                                    "Upload Attachment From..."),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        controller.openCamera();
                                                      },
                                                      child: Text(
                                                        "Camera",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  TextButton(
                                                      onPressed: () {
                                                        controller
                                                            .openGallery();
                                                      },
                                                      child: Text(
                                                        "Gallery",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  TextButton(
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                      child: Text(
                                                        "Cancel",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ))
                                                ],
                                              );
                                            });
                                      },
                                      child: Text(
                                        'UPLOAD',
                                        style: TextStyle(
                                            fontSize: 11.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Center(
                                child: Obx((() {
                                  return GestureDetector(
                                      onTap: (() {
                                        Get.to(DetailSubmissionAttachmentScreen(
                                            controller.tmpFile.value));
                                      }),
                                      child:
                                          controller.setImageView(30.h, 30.h));
                                })),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: 335,
                      height: 40,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              elevation: 10,
                              primary: HexColor("363636")),
                          onPressed: () {
                            controller.permitForm(
                                "${controller.permitSelectedDate.value}",
                                "${controller.permitStartTime.value.format(context)}",
                                "${controller.permitEndTime.value.format(context)}",
                                controller.permitDescription.text,
                                controller.permitAttachment.value);
                          },
                          child: Text(
                            "Apply Permit",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                                color: Colors.white),
                          )),
                    ),
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
