import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import '../../AttendanceController.dart';

class CheckOutForm extends GetView<AttendanceController> {
  const CheckOutForm({Key? key}) : super(key: key);

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
                maxLines: 2,
                controller: controller.clocation,
                enabled: false,
              ),
              SizedBox(
                height: 10,
              ),
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
                  Container(
                    width: Get.width / 2 - 20,
                    child: TextFormField(
                      maxLength: controller.cDate.text.trim().length,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.white,
                          filled: true),
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 12),
                      maxLines: 1,
                      controller: controller.cDate,
                      enabled: false,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Container(
                    width: Get.width / 2 - 30,
                    child: TextFormField(
                      maxLength: controller.cTime.text.trim().length,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.white,
                          filled: true),
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 12),
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
                  Text('Done List...'),
                ],
              ),
              TextFormField(
                decoration:
                    InputDecoration(fillColor: Colors.white, filled: true),
                style: TextStyle(fontSize: 12),
                maxLines: 4,
                controller: controller.taskList,
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                  width: Get.width,
                  child: ElevatedButton(
                      onPressed: () {

                        controller.checkOutOnline(controller.taskList.text);
                      },
                      child: Text('Check-out Now')))
            ]),
          ),
        ),
      ),
    );
  }
}
