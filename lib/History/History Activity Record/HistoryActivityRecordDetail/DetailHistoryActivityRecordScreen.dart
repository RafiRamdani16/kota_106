import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kota_106/History/HistoryController.dart';
import 'package:kota_106/ActivityRecord/ActivityRecordModel.dart';
import 'package:sizer/sizer.dart';
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
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 2.h,),
              Text(
                'Activity Record Detail',
                style: TextStyle(fontSize: 16.sp, fontFamily: 'Roboto'),
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
                      height: 2.h,
                    ),
                    Text('Date:     ${controller.activityRecordDate} ',
                      style: TextStyle(fontSize: 13.sp),
                    ),
                    SizedBox(
                     height: 2.h,
                    ),
                    Text('Time:    ${controller.activityRecordTime}',
                      style: TextStyle(fontSize: 13.sp),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text('Location:',
                      style: TextStyle(fontSize: 13.sp),
                    ),
                    TextFormField(
                      enabled: false,
                      decoration: InputDecoration(
                          fillColor: Colors.white, filled: true),
                      style: TextStyle(fontSize: 12.sp),
                      maxLines: 4,
                      controller: controller.locationNow,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text('Description',
                      style: TextStyle(fontSize: 13.sp),
                    ),
                    TextFormField(
                      enabled: false,
                      decoration: InputDecoration(
                          fillColor: Colors.white, filled: true),
                      style: TextStyle(fontSize: 12.sp),
                      maxLines: 4,
                      controller: controller.description,
                    ),
                    SizedBox(
                      height: 2.h
                    ),
                    Text('Photo:',
                      style: TextStyle(fontSize: 13.sp),
                    ),
                    SizedBox(height: 2.h,),
                    controller.setImageView(
                        activityRecordModel.photoName, 300, 100, "Activity Record"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
