import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:kota_106/Controllers/PermitController.dart';

class PermitScreen extends GetView<PermitController> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 100 / 100,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: HexColor('FCBC45'),
          automaticallyImplyLeading: false,
          title: const Text(
            'Permit Form',
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
                          height: Get.height - 200,
                          width: 335,
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
                                            elevation: 0,
                                            primary: Colors.white),
                                        onPressed: () {
                                          controller.permitDatePicker(context);
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
                                    Padding(
                                        padding: EdgeInsets.only(left: 160)),
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
                                              controller.permitTimePicker(
                                                  context);
                                            },
                                            child: Text(
                                              "${controller.permitStartTime.value.hour}:${controller.permitStartTime.value.minute}",
                                              style: TextStyle(
                                                  color: Colors.black),
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
                                              style: TextStyle(
                                                  color: Colors.black),
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
                                                    BorderRadius.circular(
                                                        15.0)),
                                            primary: HexColor('FFC368')),
                                        onPressed: () {},
                                        child: Text(
                                          'UPLOAD',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black),
                                        )),
                                  ],
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
      ),
    );
  }
}
