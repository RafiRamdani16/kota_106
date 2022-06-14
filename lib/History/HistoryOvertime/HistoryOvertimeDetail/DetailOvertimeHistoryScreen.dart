import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kota_106/History/HistoryController.dart';
import 'package:kota_106/Submission/Overtime/OvertimeModel.dart';

import 'package:sizer/sizer.dart';

import '../../../DetailAttachmentScreen.dart';
import '../../History After Overtime/DetailAfterOvertimeScreen.dart';
import '../EditOvertimeScreen.dart';

class DetailOvertimeHistory extends GetView<HistoryController> {
  final OvertimeModel overtimeModel;
  const DetailOvertimeHistory(this.overtimeModel);

  @override
  Widget build(BuildContext context) {
    var status = false;
    controller.description.text = overtimeModel.overtimeDescription;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 2.h,
          ),
          Text(
            'Overtime Detail',
            style: TextStyle(fontSize: 16.sp),
          ),
          Container(
            padding: EdgeInsets.only(left: 5.w),
            width: Get.width,
            height: 60.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date Submitted:  ${DateFormat('dd MMMM yyyy').format(DateTime.parse(overtimeModel.overtimeDateSubmitted))} ',
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        // Text(
                        //   'Time Submitted:  ${overtimeModel.overtimeTimeSubmitted} ',
                        //   style: TextStyle(fontSize: 12.sp),
                        // ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          'Overtime Date:  ${DateFormat('dd MMMM yyyy').format(DateTime.parse(overtimeModel.overtimeDate))}',
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Start Time: ",
                                  style: TextStyle(fontSize: 12.sp),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  overtimeModel.overtimeStartTime,
                                  style: TextStyle(fontSize: 12.sp),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Column(
                              children: [
                                Text(
                                  "End Time: ",
                                  style: TextStyle(fontSize: 12.sp),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  overtimeModel.overtimeEndTime,
                                  style: TextStyle(fontSize: 12.sp),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/images/Ellipse2.png',
                      alignment: Alignment.centerLeft,
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  'Description',
                  style: TextStyle(fontSize: 12.sp),
                ),
                TextFormField(
                  enabled: false,
                  decoration:
                      InputDecoration(fillColor: Colors.white, filled: true),
                  style: TextStyle(fontSize: 12.sp),
                  maxLines: 4,
                  controller: controller.description,
                ),
                SizedBox(height: 1.h),

                Row(
                  children: [
                    Text(overtimeModel.nameApprovalAdmin),
                    Container(
                      width: 20.w,
                      height: 2.h,
                      decoration: BoxDecoration(
                          color: controller
                              .checkStatus(overtimeModel.statusApprovalAdmin),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        overtimeModel.statusApprovalAdmin,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Visibility(
                    visible: controller.isHR(),
                    child: Row(
                      children: [
                        Text(overtimeModel.nameApprovalHR),
                        Container(
                          width: 20.w,
                          height: 2.h,
                          decoration: BoxDecoration(
                              color: controller
                                  .checkStatus(overtimeModel.statusApprovalHR),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            overtimeModel.statusApprovalHR,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    )),
                Visibility(
                    visible: controller.isAtasan(),
                    child: Row(
                      children: [
                        Text(overtimeModel.nameApprovalAtasan),
                        Container(
                          width: 20.w,
                          height: 2.h,
                          decoration: BoxDecoration(
                              color: controller
                                  .checkStatus(
                                  overtimeModel.statusApprovalAtasan),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            overtimeModel.statusApprovalAtasan,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
          Container(
            height: 5.h,
            width: 90.w,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    elevation: 10,
                    side: BorderSide(color: Colors.amber),
                    primary: Colors.white),
                onPressed: () {
                  Get.to(EditOvertimeScreen(overtimeModel.overtimeId));
                },
                child: Text(
                  "Edit Overtime Data",
                  style: TextStyle(fontSize: 14.sp, color: Colors.amber),
                )),
          ),
          SizedBox(height: 2.h),
          Visibility(
            visible: false,
            child: Container(
              height: 5.h,
              width: 90.w,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      elevation: 10,
                      side: BorderSide(color: Colors.amber),
                      primary: Colors.amber),
                  onPressed: () {
                    Get.toNamed('/afterOvertimeScreen');
                  },
                  child: Text(
                    "Form After Overtime",
                    style: TextStyle(fontSize: 14.sp, color: Colors.white),
                  )),
            ),
          ),
          Visibility(
            visible: true,
            child: Container(
              height: 5.h,
              width: 90.w,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      elevation: 10,
                      side: BorderSide(color: Colors.amber),
                      primary: Colors.amber),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return DetailAfterOvertimeHistory(overtimeModel.overtimeId);
                        });
                  },
                  child: Text(
                    "Detail After Overtime",
                    style: TextStyle(fontSize: 14.sp, color: Colors.white),
                  )),
            ),
          ),
          SizedBox(height: 2.h),
          Container(
            height: 5.h,
            width: 90.w,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    elevation: 10,
                    side: BorderSide(color: Colors.black),
                    primary: Color.fromRGBO(0, 0, 0, 1)),
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  "Back To History",
                  style: TextStyle(fontSize: 14.sp, color: Colors.white),
                )),
          ),
          SizedBox(height: 2.h),
        ],
      ),
    );
  }
}
