import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kota_106/Approval/OvertimeApproval/OvertimeApprovalController.dart';
import 'package:sizer/sizer.dart';
import '../../DetailAttachmentScreen.dart';

class DetailAfterOvertimeApproval extends GetView<OvertimeApprovalController> {
 
  
  @override
  Widget build(BuildContext context) {
    controller.description.text =
        controller.afterOvertimeApprovalModel[0].description;
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
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          'Date Submitted:  ${DateFormat('dd MMMM yyyy').format(DateTime.parse(controller.afterOvertimeApprovalModel[0].dateSubmit))} ',
                          style: TextStyle(fontSize: 11.sp),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          'Time Submitted: ${DateFormat('HH:mm').format(DateTime.parse(controller.afterOvertimeApprovalModel[0].dateSubmit))} ',
                          style: TextStyle(fontSize: 11.sp),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          'After Overtime Date:  ${DateFormat('dd MMMM yyyy').format(DateTime.parse(controller.afterOvertimeApprovalModel[0].datePerform))}',
                          style: TextStyle(fontSize: 11.sp),
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
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  controller
                                      .afterOvertimeApprovalModel[0].startTime,
                                  style: TextStyle(fontSize: 11.sp),
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
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  controller
                                      .afterOvertimeApprovalModel[0].endTime,
                                  style: TextStyle(fontSize: 11.sp),
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
                      TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  enabled: false,
                  decoration:
                      InputDecoration(fillColor: Colors.white, filled: true),
                  style: TextStyle(fontSize: 11.sp),
                  maxLines: 4,
                  controller: controller.description,
                ),
                SizedBox(height: 1.h),
                Text(
                  'Attachment:',
                  style:
                      TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Center(
                  child: controller.setImageView(
                      controller.afterOvertimeApprovalModel[0].attachment,
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
                          Get.to(DetailAttachmentScreen(controller
                              .afterOvertimeApprovalModel[0].attachment));
                        },
                        child: Text(
                          "See Full Attachment",
                          style:
                              TextStyle(fontSize: 12.sp, color: Colors.white),
                        )),
                  ),
                ),
                // Text(
                //   '${DateFormat('dd MMMM yyyy').format(DateTime.parse(controller.afterOvertimeApprovalModel.afterOvertimeDateSubmitted))} ',
                //   style: TextStyle(fontSize: 11.sp),
                // ),
              ],
            ),
          ),
          SizedBox(height: 2.h),
          Visibility(
            visible: controller.checkStatusOvertimeApproval(
                controller.afterOvertimeApprovalModel[0].statusApproval),
            child: Container(
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
                    controller.giveAfterOvertimeDecision(
                        "Approved",
                        controller.afterOvertimeApprovalModel[0].approvalId,
                        controller.afterOvertimeApprovalModel[0].submissionAttributeId);
                  },
                  child: Text(
                    "Approve",
                    style: TextStyle(fontSize: 14.sp, color: Colors.white),
                  )),
            ),
          ),
          SizedBox(height: 2.h),
          Visibility(
            visible: controller.checkStatusOvertimeApproval(
                controller.afterOvertimeApprovalModel[0].statusApproval),
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
                    controller.giveAfterOvertimeDecision(
                        "Rejected",
                        controller.afterOvertimeApprovalModel[0].approvalId,
                        controller.afterOvertimeApprovalModel[0].submissionId);
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
                  "Back To Detail Approval Overtime",
                  style: TextStyle(fontSize: 14.sp, color: Colors.white),
                )),
          ),
          SizedBox(height: 2.h),
        ],
      ),
    );
  }
}
