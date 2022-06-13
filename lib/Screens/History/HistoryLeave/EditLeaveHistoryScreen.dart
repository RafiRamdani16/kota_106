import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

import 'package:kota_106/Controllers/LeaveController.dart';
import 'package:kota_106/Models/LeaveModel.dart';
import 'package:sizer/sizer.dart';

import '../../Submission/DetailSubmissionAttachmentScreen.dart';
import 'DetailLeaveHistoryScreen.dart';

class EditLeaveHistoryScreen extends GetView<LeaveController> {
  final LeaveModel leaveModel;
  const EditLeaveHistoryScreen(this.leaveModel);

  @override
  Widget build(BuildContext context) {
    controller.remainingDays.text = leaveModel.leaveRemainingDays;
    controller.leaveType.text = leaveModel.leaveType;
    controller.startLeaveDate.value = DateTime.parse(leaveModel.leaveStartDate);
    controller.endLeaveDate.value = DateTime.parse(leaveModel.leaveEndDate);
    controller.leaveDescription.text = leaveModel.leaveDescription;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: HexColor('FCBC45'),
        automaticallyImplyLeading: false,
        title: const Text(
          'Edit Leave Form',
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
                              Text("Remaining Days Off"),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                width: 100,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      fillColor: Colors.white, filled: true),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 12),
                                  maxLines: 1,
                                  controller: controller.remainingDays,
                                  enabled: false,
                                ),
                              ),
                              Text("Leave Type"),
                              SizedBox(
                                height: 20.0,
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
                                height: 20.0,
                              ),
                              Row(
                                children: [
                                  Text('Start Date'),
                                  Padding(padding: EdgeInsets.only(left: 160)),
                                  Text('End Date')
                                ],
                              ),
                              Row(
                                children: [
                                  Obx(() {
                                    return Container(
                                        width: 120,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              elevation: 0,
                                              primary: Colors.white),
                                          onPressed: () {
                                            controller.pickLeaveDate(context);
                                          },
                                          child: Text(
                                            DateFormat('yyyy-MM-dd').format(
                                                controller
                                                    .startLeaveDate.value),
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ));
                                  }),
                                  SizedBox(
                                    width: 60,
                                  ),
                                  Obx((() {
                                    return Container(
                                        width: 120,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              elevation: 0,
                                              primary: Colors.white),
                                          onPressed: () {
                                            controller.pickLeaveDate(context);
                                          },
                                          child: Text(
                                            DateFormat('yyyy-MM-dd').format(
                                                controller.endLeaveDate.value),
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ));
                                  })),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('Description'),
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
                                  Text("Attachment"),
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
                                            fontSize: 12, color: Colors.black),
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
                      width: 80.w,
                      height: 5.h,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              elevation: 10,
                              primary: HexColor("363636")),
                          onPressed: () {},
                          child: Text(
                            "Apply Leave",
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 16,
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
