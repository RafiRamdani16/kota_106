import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:kota_106/Submission/Overtime/OvertimeController.dart';
import 'package:sizer/sizer.dart';

class OvertimeScreen extends GetView<OvertimeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: HexColor('FCBC45'),
        automaticallyImplyLeading: false,
        title: Text(
          'Overtime Form',
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
                              Text("Date",
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Roboto",
                                  )),
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
                                        controller.overtimeDatePicker(context);
                                      },
                                      child: Text(
                                        DateFormat('yyyy-MM-dd').format(
                                            controller
                                                .overtimeSelectedDate.value),
                                        style: TextStyle(
                                          fontSize: 11.sp,
                                          fontFamily: "Roboto",
                                        ),
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
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Roboto",
                                    ),
                                  ),
                                  SizedBox(
                                    width: 42.w,
                                  ),
                                  Text(
                                    'End Time',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Roboto",
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Obx(() {
                                    return Container(
                                        width: 20.w,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              elevation: 5,
                                              primary: Colors.white),
                                          onPressed: () {
                                            controller
                                                .overtimeTimePicker(context);
                                          },
                                          child: Text(
                                            "${controller.overtimeStartTime.value.hour}:${controller.overtimeStartTime.value.minute}",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ));
                                  }),
                                  SizedBox(
                                    width: 40.w,
                                  ),
                                  Obx(() {
                                    return Container(
                                        width: 20.w,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              elevation: 5,
                                              primary: Colors.white),
                                          onPressed: () {
                                            controller
                                                .overtimeTimePicker(context);
                                          },
                                          child: Text(
                                            "${controller.overtimeEndTime.value.hour}:${controller.overtimeEndTime.value.minute}",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ));
                                  }),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                'Description',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Roboto",
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 10)),
                              TextFormField(
                                decoration: InputDecoration(
                                    fillColor: Colors.white, filled: true),
                                maxLines: 2,
                                controller: controller.overtimeDescription,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ]),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: 90.w,
                      height: 5.h,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              elevation: 10,
                              primary: HexColor("363636")),
                          onPressed: () {
                            controller.overtimeForm(
                                "${controller.overtimeSelectedDate.value}",
                                "${controller.overtimeStartTime.value.hour}:${controller.overtimeStartTime.value.minute}",
                                "${controller.overtimeEndTime.value.hour}:${controller.overtimeEndTime.value.minute}",
                                controller.overtimeDescription.text);
                          },
                          child: Text(
                            "Apply Overtime",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Roboto",
                            ),
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
