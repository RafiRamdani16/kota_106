import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/AttendanceController.dart';
import 'package:sizer/sizer.dart';
class OfficeCheckInForm extends GetView<AttendanceController> {
  const OfficeCheckInForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    controller.currentDate();
    controller.getCurrentLocation();
    return SingleChildScrollView(
      child: Center(
        child: Form(
          child: Container(
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
                maxLines: 3,
                controller: controller.clocation,
                enabled: false,
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  Image.asset('assets/images/Icon/Calendar.png'),
                  Text('Check-in Date'),
                  Padding(padding: EdgeInsets.only(left: 60)),
                  Image.asset('assets/images/Icon/Clock.png'),
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
                      textAlign: TextAlign.left,
                      decoration:
                          InputDecoration(disabledBorder: InputBorder.none),
                      style: TextStyle(fontSize: 12),
                      maxLines: 1,
                      controller: controller.cDate,
                      enabled: false,
                    ),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Container(
                    width: 80,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      decoration:
                          InputDecoration(disabledBorder: InputBorder.none),
                      style: TextStyle(fontSize: 12),
                      maxLines: 1,
                      controller: controller.cTime,
                      enabled: false,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  Image.asset('assets/images/Icon/Note.png'),
                  Text('You Want To...'),
                ],
              ),
              TextFormField(
                style: TextStyle(fontSize: 12),
                maxLines: 4,
                controller: controller.note,
              ),
              Container(
                  width: Get.width,
                  child: ElevatedButton(
                      onPressed: () {
                        String checkInTime =
                            '${controller.cDate.text} ${controller.cTime.text}';

                        controller.checkInOffline(controller.clocation.text,
                            checkInTime, controller.note.text);
                      },
                      child: Text('Check-in Now')))
            ]),
          ),
        ),
      ),
    );
  }
}
