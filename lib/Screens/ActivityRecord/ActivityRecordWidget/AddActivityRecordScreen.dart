import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kota_106/Controllers/ActivityRecordController.dart';

class AddActivityRecordScreen extends GetView<ActivityRecordController> {
  @override
  Widget build(BuildContext context) {
    var screenHeightSize = MediaQuery.of(context).size.height;
    var screenWidthSize = MediaQuery.of(context).size.width;
    return AspectRatio(
      aspectRatio: 100 / 100,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: HexColor('FCBC45'),
          automaticallyImplyLeading: false,
          title: const Text(
            'Activity Record',
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
          height: screenHeightSize,
          width: screenWidthSize,
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
                          height: screenHeightSize - 200,
                          width: 335,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text('Date'),
                                    Padding(
                                        padding: EdgeInsets.only(left: 160)),
                                    Text('Time')
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 100,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            fillColor: Colors.white,
                                            filled: true),
                                        textAlign: TextAlign.left,
                                        style: TextStyle(fontSize: 12),
                                        maxLines: 1,
                                        controller: controller.dateNow,
                                        // enabled: false,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 80.0,
                                    ),
                                    Container(
                                      width: 100.0,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            filled: true,
                                            fillColor: Colors.white),
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                        maxLines: 1,
                                        controller: controller.timeNow,
                                        // enabled: false,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text('Location'),
                                Padding(padding: EdgeInsets.only(top: 10)),
                                TextFormField(
                                  decoration: InputDecoration(
                                      fillColor: Colors.white, filled: true),
                                  maxLines: 2,
                                  controller: controller.locationNow,
                                  // enabled: false,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text('You Want To...'),
                                TextFormField(
                                  decoration: InputDecoration(
                                      fillColor: Colors.white, filled: true),
                                  style: TextStyle(fontSize: 12),
                                  maxLines: 4,
                                  controller: controller.description,
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text('Photo'),
                                Row(
                                  children: [
                                    Obx((() {
                                      return controller.setImageView();
                                    })),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        15.0)),
                                            primary: HexColor('FFC368')),
                                        onPressed: () {
                                          controller.openCamera();
                                        },
                                        child: Text(
                                          'Add Photo',
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
                            onPressed: () {
                              controller.addActivityRecord();
                            },
                            child: Text(
                              "New Activity",
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
