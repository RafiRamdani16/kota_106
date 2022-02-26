import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controllers/AttendanceController/AttendanceController.dart';

class CheckOutForm extends GetView<AttendanceController> {
  const CheckOutForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // controller.getAddress();
    // controller.currentTime();
    controller.currentDate();
    var screenHeightSize = MediaQuery.of(context).size.height;
    var screenWidthSize = MediaQuery.of(context).size.width;
    final _formkey = Get.put(GlobalKey<FormState>());
    controller.clocation.text = controller.currentAddress.value;
    controller.cDateTime.text = controller.date.value;
    controller.cTime.text = controller.time.value;
    return Form(
      key: _formkey,
      child: SingleChildScrollView(
        child: Container(
          height: screenHeightSize,
          padding: EdgeInsets.only(left: 20),
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
            Row(
              children: [
                Image.asset('assets/images/Icon/Calendar.png'),
                SizedBox(
                  width: 10.0,
                ),
                Text('Check-in Date'),
                Padding(padding: EdgeInsets.only(left: 60)),
                Image.asset('assets/images/Icon/Clock.png'),
                SizedBox(
                  width: 10.0,
                ),
                Text('Check-in Time')
              ],
            ),
            Row(
              children: [
                Container(
                  width: screenWidthSize / 2 - 20,
                  child: TextFormField(
                    maxLength: controller.cDateTime.text.trim().length,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true),
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 12),
                    maxLines: 1,
                    controller: controller.cDateTime,
                    enabled: false,
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  width: screenWidthSize / 2 - 30,
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
            Container(
                width: screenWidthSize,
                child: ElevatedButton(
                    onPressed: () {}, child: Text('Check-out Now')))
          ]),
        ),
      ),
    );
  }
}
