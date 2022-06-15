import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kota_106/Approval/OvertimeApproval/OvertimeApprovalController.dart';

import 'package:sizer/sizer.dart';

import '../../AfterOvertimeApproval/DetailAfterOvertimeScreen.dart';
import 'OvertimeApprovalModel.dart';

class OvertimeApprovalDetailScreen
    extends GetView<OvertimeApprovalController> {
  final OvertimeApprovalModel overtimeModel;
  const OvertimeApprovalDetailScreen(this.overtimeModel);

  @override
  Widget build(BuildContext context) {
    
    controller.overtimeDescription.value = overtimeModel.overtimeDescription;
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
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          Container(
            padding: EdgeInsets.only(left: 5.w),
            width: Get.width,
            height: 70.h,
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
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          'Time Submitted:  ${overtimeModel.overtimeTimeSubmitted} ',
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          'Overtime Date:  ${DateFormat('dd MMMM yyyy').format(DateTime.parse(overtimeModel.overtimeDate))}',
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.bold),
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
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold),
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
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold),
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
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  controller.overtimeDescription.value,
                  style: TextStyle(fontSize: 12.sp),
                ),
                SizedBox(height: 2.h),
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
                    side: BorderSide(color: Colors.lightGreen),
                    primary: Colors.lightGreen),
                onPressed: () {
                  controller.giveDecision("Approved", overtimeModel);
                },
                child: Text(
                  "Approve",
                  style: TextStyle(fontSize: 14.sp, color: Colors.white),
                )),
          ),
          SizedBox(height: 2.h),
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
                      side: BorderSide(color: Colors.red),
                      primary: Colors.red),
                  onPressed: () {
                    controller.giveDecision("Rejected", overtimeModel);
                  },
                  child: Text(
                    "Disapprove",
                    style: TextStyle(fontSize: 14.sp, color: Colors.white),
                  )),
            ),
          ),
          SizedBox(
            height: 2.h,
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
                          return DetailAfterOvertimeApproval();
                        });
                  },
                  child: Text(
                    "After Overtime Details",
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
