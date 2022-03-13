import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kota_106/Controllers/ActivityRecordController.dart';
import 'package:kota_106/Models/ActivityRecordModel.dart';

class DetailActivityRecordScreen extends GetView<ActivityRecordController> {
  final ActivityRecordModel activityRecordModel;
  DetailActivityRecordScreen(this.activityRecordModel);
  @override
  Widget build(BuildContext context) {
    var screenHeightSize = MediaQuery.of(context).size.height;
    var screenWidthSize = MediaQuery.of(context).size.width;

    controller.locationNow.text = activityRecordModel.location;
    controller.timeNow.text = activityRecordModel.time;
    controller.dateNow.text = activityRecordModel.date;
    controller.description.text = activityRecordModel.description;

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
          padding: EdgeInsets.all(40),
          height: screenHeightSize,
          width: screenWidthSize,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image:
                      AssetImage("assets/images/BackgroundActivityRecord.jpg"),
                  fit: BoxFit.cover)),
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
                        width: screenWidthSize,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('Date'),
                                  Padding(padding: EdgeInsets.only(left: 160)),
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
                                      enabled: false,
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
                                      enabled: false,
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
                                style: TextStyle(fontSize: 12),
                                maxLines: 2,
                                controller: controller.locationNow,
                                enabled: false,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('Description'),
                              TextFormField(
                                decoration: InputDecoration(
                                    fillColor: Colors.white, filled: true),
                                style: TextStyle(fontSize: 12),
                                maxLines: 4,
                                controller: controller.description,
                                enabled: false,
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text('Photo'),
                              Padding(
                                padding: EdgeInsets.only(top: 30, left: 150),
                                child: Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/Icon/AccountBox.png"),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                            ]),
                      ),
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
