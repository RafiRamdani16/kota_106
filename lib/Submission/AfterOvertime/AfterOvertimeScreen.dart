import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kota_106/Submission/Overtime/OvertimeController.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class AfterOvertimeScreen extends GetView<OvertimeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: HexColor('FCBC45'),
        automaticallyImplyLeading: false,
        title: Text(
          'After Overtime Form',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
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
          padding: EdgeInsets.only(top: 5.h),
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
                              Text(
                                "Date",
                                style: TextStyle(
                                    fontSize: 13.sp,
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
                                        controller.overtimeDatePicker(context);
                                      },
                                      child: Text(
                                        DateFormat('yyyy-MM-dd').format(
                                            controller
                                                .overtimeSelectedDate.value),
                                        style: TextStyle(fontSize: 12.sp),
                                      ),
                                    ));
                              })),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                children: [
                                  Text('Start Time',
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    width: 40.w,
                                  ),
                                  Text('End Time',
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.bold))
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
                                            style: TextStyle(fontSize: 12.sp),
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
                                            style: TextStyle(fontSize: 12.sp),
                                          ),
                                        ));
                                  }),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('Description',
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 2.h,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    fillColor: Colors.white, filled: true),
                                maxLines: 2,
                                controller: controller.overtimeDescription,
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(children: [
                                Text("Attachment",
                                    style: TextStyle(
                                        fontSize: 13.sp,
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
                                    onPressed: () {},
                                    child: Text(
                                      'UPLOAD',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                      ),
                                    ))
                              ]),
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
                          onPressed: () {},
                          child: Text("Apply After Overtime",
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
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
