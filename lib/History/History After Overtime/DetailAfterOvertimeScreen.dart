import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kota_106/History/HistoryController.dart';
import 'package:sizer/sizer.dart';

import '../../DetailAttachmentScreen.dart';
import 'EditAfterOvertimeScreen.dart';

class DetailAfterOvertimeHistory extends GetView<HistoryController> {
  final int idOvertime;
  const DetailAfterOvertimeHistory(this.idOvertime);

  @override
  Widget build(BuildContext context) {
    controller.getAfterOvertimeHistory(idOvertime);
    
    controller.description.text =
        controller.afterOvertimeModel[idOvertime].afterOvertimeDescription;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 2.h,
          ),
          Text(
            'After Overtime Detail',
            style: TextStyle(fontSize: 16.sp),
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
                        Row(
                          children: [
                            Text("Status Approval",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 10.w,
                            ),
                            Container(
                              width: 20.w,
                              height: 2.h,
                              decoration: BoxDecoration(
                                  color: controller.checkStatus(controller
                                      .afterOvertimeModel[idOvertime]
                                      .afterOvertimeStatus),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                controller
                                    .afterOvertimeModel[idOvertime]
                                    .afterOvertimeStatus,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          'Date Submitted:  ${DateFormat('dd MMMM yyyy').format(DateTime.parse(controller.afterOvertimeModel[idOvertime].afterOvertimeDateSubmitted))} ',
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        // Text(
                        //   'Time Submitted:  ${controller.afterOvertimeModel.afterOvertimeTimeSubmitted} ',
                        //   style: TextStyle(fontSize: 12.sp),
                        // ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          'Overtime Date:  ${DateFormat('dd MMMM yyyy').format(DateTime.parse(controller.afterOvertimeModel[idOvertime].afterOvertimeDate))}',
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
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  controller.afterOvertimeModel[idOvertime]
                                      .afterOvertimeStartTime,
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
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  controller
                                      .afterOvertimeModel[idOvertime]
                                      .afterOvertimeEndTime,
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
                  height: 2.h,
                ),
                Text(
                  'Description',
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
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
                Text(
                  'Attachment:',
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Center(
                  child: controller.setImageView(
                      controller.afterOvertimeModel[idOvertime]
                          .afterOvertimeAttachment,
                      20.w,
                      15.h,
                      "Overtime"),
                ),
                SizedBox(height: 1.h),
                Center(
                  child: Container(
                    height: 3.h,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            elevation: 10,
                            side: BorderSide(color: Colors.amber),
                            primary: Colors.amber),
                        onPressed: () {
                          Get.to(DetailAttachmentScreen("testingProfile"));
                        },
                        child: Text(
                          "See Full Attachment",
                          style:
                              TextStyle(fontSize: 14.sp, color: Colors.white),
                        )),
                  ),
                ),
              ],
            ),
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
                      side: BorderSide(color: Colors.amber),
                      primary: Colors.amber),
                  onPressed: () {
                    Get.to(EditAfterOvertimeScreen(
                        controller.afterOvertimeModel[idOvertime]));
                  },
                  child: Text(
                    "Edit After Overtime",
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
                  "Back To Detail Overtime",
                  style: TextStyle(fontSize: 14.sp, color: Colors.white),
                )),
          ),
          SizedBox(height: 2.h),
        ],
      ),
    );
  }
}
