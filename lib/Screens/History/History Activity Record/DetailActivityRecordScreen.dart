import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kota_106/Controllers/HistoryController.dart';
import 'package:kota_106/Models/ActivityRecordModel.dart';

class DetailActivityRecordScreen extends GetView<HistoryController> {
  final ActivityRecordModel activityRecordModel;
  DetailActivityRecordScreen(this.activityRecordModel);
  @override
  Widget build(BuildContext context) {
    var screenHeightSize = MediaQuery.of(context).size.height;
    var screenWidthSize = MediaQuery.of(context).size.width;

    controller.changeFormatDateForActivityHistory(activityRecordModel.date);
    controller.locationNow.text = activityRecordModel.location;
    controller.description.text = activityRecordModel.description;

    return Center(
      child: AspectRatio(
        aspectRatio: 100 / 100,
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Activity Record Detail',
                  style: TextStyle(fontSize: 16, fontFamily: 'Roboto'),
                ),
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/backgroundDetailHistory.png"),
                          fit: BoxFit.cover)),
                  width: screenWidthSize,
                  height: screenHeightSize - 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text('Date:     ${controller.activityRecordDate} '),
                      SizedBox(
                        height: 15,
                      ),
                      Text('Time:    ${controller.activityRecordTime}'),
                      SizedBox(
                        height: 15,
                      ),
                      Text('Location:'),
                      TextFormField(
                        enabled: false,
                        decoration: InputDecoration(
                            fillColor: Colors.white, filled: true),
                        style: TextStyle(fontSize: 12),
                        maxLines: 4,
                        controller: controller.locationNow,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text('Description'),
                      TextFormField(
                        enabled: false,
                        decoration: InputDecoration(
                            fillColor: Colors.white, filled: true),
                        style: TextStyle(fontSize: 12),
                        maxLines: 4,
                        controller: controller.description,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text('Photo:'),
                      controller.setImageView(
                          activityRecordModel.photoName, 300, 100),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
