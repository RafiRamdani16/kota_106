import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:kota_106/Submission/Permit/PermitController.dart';
import 'package:sizer/sizer.dart';

import '../../Submission/DetailSubmissionAttachmentScreen.dart';

class EditPermitHistoryScreen extends GetView<PermitController> {
  final int permitId;
  const EditPermitHistoryScreen(this.permitId);
  @override
  Widget build(BuildContext context) {
    controller.getEditPermit(permitId);
    controller.permitSelectedDate.value =
        DateTime.parse(controller.permitModel.permitDate);
    controller.permitStartTime.value = TimeOfDay.fromDateTime(
        DateFormat("HH:mm").parse("${controller.permitModel.permitStartTime}"));
    controller.permitEndTime.value = TimeOfDay.fromDateTime(
        DateFormat("HH:mm").parse("${controller.permitModel.permitEndTime}"));
    controller.permitDescription.text =
        controller.permitModel.permitDescription;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: HexColor('FCBC45'),
        automaticallyImplyLeading: false,
        title: const Text(
          'Edit Permit Form',
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
                              Text("Date"),
                              SizedBox(
                                height: 20.0,
                              ),
                              Obx((() {
                                return Container(
                                    width: 120,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 0, primary: Colors.white),
                                      onPressed: () {
                                        controller
                                            .editPermitDatePicker(context);
                                      },
                                      child: Text(
                                        DateFormat('yyyy-MM-dd').format(
                                            controller
                                                .permitSelectedDate.value),
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ));
                              })),
                              SizedBox(
                                height: 20.0,
                              ),

                              Row(
                                children: [
                                  Text('Start Time'),
                                  Padding(padding: EdgeInsets.only(left: 160)),
                                  Text('End Time')
                                ],
                              ),
                              Row(
                                children: [
                                  Obx(() {
                                    return Container(
                                        width: 100,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              elevation: 0,
                                              primary: Colors.white),
                                          onPressed: () {
                                            controller
                                                .permitTimePicker(context);
                                          },
                                          child: Text(
                                            "${controller.permitStartTime.value.hour}:${controller.permitStartTime.value.minute}",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ));
                                  }),
                                  SizedBox(
                                    width: 80.0,
                                  ),
                                  Obx(() {
                                    return Container(
                                        width: 100.0,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              elevation: 0,
                                              primary: Colors.white),
                                          onPressed: () {
                                            controller
                                                .permitTimePicker(context);
                                          },
                                          child: Text(
                                            "${controller.permitEndTime.value.hour}:${controller.permitEndTime.value.minute}",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ));
                                  }),
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
                                controller: controller.permitDescription,
                                enabled: false,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              // Text('Description...'),
                              // TextFormField(
                              //   decoration: InputDecoration(
                              //       fillColor: Colors.white, filled: true),
                              //   style: TextStyle(fontSize: 12),
                              //   maxLines: 4,
                              //   controller: controller.description,
                              // ),

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
                                height: 2.h,
                              ),
                              Center(
                                child: Obx((() {
                                  return GestureDetector(
                                      onTap: (() {
                                        Get.to(DetailSubmissionAttachmentScreen(
                                            controller.tmpFile.value));
                                      }),
                                      child:
                                          controller.setImageView(20.h, 30.h));
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
                            "Apply Permit",
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
