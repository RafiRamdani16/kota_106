import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kota_106/Submission/Overtime/OvertimeController.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

import 'package:sizer/sizer.dart';

class EditOvertimeScreen extends GetView<OvertimeController> {
  final int overtimeId;
  const EditOvertimeScreen(this.overtimeId);

  @override
  Widget build(BuildContext context) {
    controller.getDetailOvertime(overtimeId);
    controller.overtimeSelectedDate.value =
        DateTime.parse(controller.overtimeEditModel.overtimeDate);
    // DateTime formated = DateTime.parse(overtimeModel.overtimeStartTime);

    // DateTime format = DateTime.parse(formatedStartTIme);
    controller.overtimeStartTime.value = TimeOfDay.fromDateTime(
        DateFormat("HH:mm")
            .parse("${controller.overtimeEditModel.overtimeStartTime}"));
    controller.overtimeEndTime.value = TimeOfDay.fromDateTime(
        DateFormat("HH:mm")
            .parse("${controller.overtimeEditModel.overtimeEndTime}"));
    controller.overtimeDescription.text =
        controller.overtimeEditModel.overtimeDescription;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: HexColor('FCBC45'),
        automaticallyImplyLeading: false,
        title: const Text(
          'Edit Overtime Form',
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
                                            .editOvertimeDatePicker(context);
                                      },
                                      child: Text(
                                        DateFormat('yyyy-MM-dd').format(
                                            controller
                                                .overtimeSelectedDate.value),
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
                                height: 20,
                              ),
                              Text('Description'),
                              Padding(padding: EdgeInsets.only(top: 10)),
                              TextFormField(
                                decoration: InputDecoration(
                                    fillColor: Colors.white, filled: true),
                                maxLines: 2,
                                controller: controller.overtimeDescription,
                              ),
                            ]),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Center(
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
                            "Apply Overtime",
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
