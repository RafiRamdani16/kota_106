import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:kota_106/Submission/Leave/LeaveController.dart';

import '../DetailSubmissionAttachmentScreen.dart';

class LeaveScreen extends GetView<LeaveController> {
  @override
  Widget build(BuildContext context) {
    controller.remainingDays.text = "12 days";
    // var startLeaveDate = controller.leaveDateTimeRange.start.obs;
    // var endLeaveDate = controller.leaveDateTimeRange.end.obs;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: HexColor('FCBC45'),
        automaticallyImplyLeading: false,
        title: Text(
          'Leave Form',
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
                        height: 70.h,
                        width: 90.w,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(() {
                                return Visibility(
                                    visible: controller.selectedType.value ==
                                            "Annual Leave"
                                        ? true
                                        : false,
                                    child: Column(
                                      children: [
                                        Text(
                                          "Remaining Days Off",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12.sp),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Container(
                                          width: 100,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                fillColor: Colors.white,
                                                filled: true),
                                            textAlign: TextAlign.left,
                                            style: TextStyle(fontSize: 11.sp),
                                            maxLines: 1,
                                            controller:
                                                controller.remainingDays,
                                            enabled: false,
                                          ),
                                        ),
                                      ],
                                    ));
                              }),
                              SizedBox(height: 2.h),
                              Text(
                                "Leave Type",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                  width: Get.width,
                                  child: Obx(
                                    () {
                                      return DropdownButton(
                                        isExpanded: true,
                                        icon: Icon(Icons.arrow_drop_down),
                                        value: controller.selectedType.value,
                                        onChanged: (String? value) {
                                          controller.selectedType.value =
                                              value!;
                                        },
                                        items: <DropdownMenuItem<String>>[
                                          DropdownMenuItem(
                                            child: Text(
                                              "Annual Leave",
                                              style: TextStyle(fontSize: 11.sp),
                                            ),
                                            value: "Annual Leave",
                                          ),
                                          DropdownMenuItem(
                                            child: Text("Sick Leave",
                                                style:
                                                    TextStyle(fontSize: 11.sp)),
                                            value: "Sick Leave",
                                          ),
                                          DropdownMenuItem(
                                            child: Text("Other Leave",
                                                style:
                                                    TextStyle(fontSize: 11.sp)),
                                            value: "Other Leave",
                                          ),
                                        ],
                                      );
                                    },
                                  )),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Start Date',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.sp),
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 160)),
                                  Text(
                                    'End Date',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.sp),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Obx(() {
                                    return Container(
                                        width: 30.w,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              elevation: 5,
                                              primary: Colors.white),
                                          onPressed: () {
                                            controller.pickLeaveDate(context);
                                          },
                                          child: Text(
                                            DateFormat('yyyy-MM-dd').format(
                                                controller
                                                    .startLeaveDate.value),
                                            style: TextStyle(fontSize: 11.sp),
                                          ),
                                        ));
                                  }),
                                  SizedBox(
                                    width: 25.w,
                                  ),
                                  Obx((() {
                                    return Container(
                                        width: 30.w,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              elevation: 5,
                                              primary: Colors.white),
                                          onPressed: () {
                                            controller.pickLeaveDate(context);
                                          },
                                          child: Text(
                                            DateFormat('yyyy-MM-dd').format(
                                                controller.endLeaveDate.value),
                                            style: TextStyle(fontSize: 11.sp),
                                          ),
                                        ));
                                  })),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Description',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp),
                              ),
                              Padding(padding: EdgeInsets.only(top: 10)),
                              TextFormField(
                                decoration: InputDecoration(
                                    fillColor: Colors.white, filled: true),
                                maxLines: 2,
                                controller: controller.leaveDescription,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Attachment",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.sp),
                                  ),
                                  SizedBox(
                                    width: 20.0,
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
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11.sp),
                                      )),
                                
                                ],
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Center(
                                child: Obx((() {
                                  return GestureDetector(
                                      onTap: (() {
                                        Get.to(DetailSubmissionAttachmentScreen(
                                            controller.tmpFile.value));
                                      }),
                                      child:
                                          controller.setImageView(15.h, 30.h));
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
                            controller.leaveForm(
                                controller.selectedType.value,
                                "${controller.startLeaveDate.value}",
                                "${controller.endLeaveDate.value}",
                                controller.leaveDescription.text,
                                controller.leaveAttachment.value);
                          },
                          child: Text(
                            "Apply Leave",
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
