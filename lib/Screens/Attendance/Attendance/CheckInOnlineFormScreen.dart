import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';


import '../../../Controllers/AttendanceController.dart';

class CheckInForm extends GetView<AttendanceController> {
  @override
  Widget build(BuildContext context) {
    
  
    var screenHeightSize = MediaQuery.of(context).size.height;
    var screenWidthSize = MediaQuery.of(context).size.width;
    
    return Center(
      child: Form(
        key: controller.formkey,
        child: Container(
          color: HexColor('F5F5F5'),
          height: screenHeightSize,
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
              decoration:
                  InputDecoration(fillColor: Colors.white, filled: true),
              maxLines: 2,
              controller: controller.clocation,
              enabled: false,
            ),
            Row(children: [
              Image.asset(
                'assets/images/Icon/Camera.png',
                width: 40,
                height: 40,
              ),
              Text('Check-in Photo'),
            ]),
            Row(
              children: [
                Obx((() {
                  return controller.setImageView();
                })),
                ElevatedButton(
                    onPressed: () {
                      controller.openCamera();
                    },
                    child: Text('Take Picture')),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
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
                SizedBox(
                  width: 45.0,
                ),
                Container(
                  width: 100,
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                    maxLines: 1,
                    controller: controller.cDate,
                    enabled: false,
                  ),
                ),
                SizedBox(
                  width: 80.0,
                ),
                Container(
                  width: 80.0,
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.white),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                    ),
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
                Text('You Want To...'),
              ],
            ),
            TextFormField(
              decoration:
                  InputDecoration(fillColor: Colors.white, filled: true),
              style: TextStyle(fontSize: 12),
              maxLines: 4,
              controller: controller.note,
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
                width: screenWidthSize - 20,
                child: ElevatedButton(
                    onPressed: () {
                      String checkInTime =
                          '${controller.cDate.text} ${controller.cTime.text}';

                      controller.checkInOnline(controller.clocation.text,
                          checkInTime, controller.note.text);
                    },
                    child: Text('Check-in Now')))
          ]),
        ),
      ),
    );
  
  }
}
