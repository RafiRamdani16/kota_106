import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kota_106/Approval/LeaveApproval/LeaveApprovalController.dart';
import 'package:kota_106/Approval/LeaveApproval/LeaveApprovalDetail/LeaveApprovalModel.dart';
import 'package:sizer/sizer.dart';

import '../../../DetailAttachmentScreen.dart';

class LeaveApprovalDetailScreen extends GetView<LeaveApprovalController> {
  final LeaveApprovalModel leaveModel;

  const LeaveApprovalDetailScreen(this.leaveModel);
  @override
  Widget build(BuildContext context) {
    controller.leaveDescription.value = leaveModel.description;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 2.h,
          ),
          Text(
            'Leave Application Detail',
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
                          'Date Submitted:  ${DateFormat('dd MMMM yyyy').format(DateTime.parse(leaveModel.dateSubmit))} ',
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          'Time Submitted:  ${DateFormat('HH:mm').format(DateTime.parse(leaveModel.dateSubmit).toLocal())}',
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          'Leave Type:  ${leaveModel.type}',
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
                                  "Start Date: ",
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  "${DateFormat('dd MMMM yyyy').format(DateTime.parse(leaveModel.dateStart))}",
                                  style: TextStyle(fontSize: 12.sp),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Column(
                              children: [
                                Text(
                                  "End Date: ",
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  "${DateFormat('dd MMMM yyyy').format(DateTime.parse(leaveModel.dateEnd))}",
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
                  height: 1.h,
                ),
                Text(
                  controller.leaveDescription.value,
                  style: TextStyle(fontSize: 12.sp),
                ),
                SizedBox(height: 2.h),
                Text('Attachment:',
                    style: TextStyle(
                        fontSize: 13.sp, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 1.h,
                ),
                Center(
                  child: controller.setImageView(
                      leaveModel.attachment, 200, 100, "Permit"),
                ),
                SizedBox(
                  height: 1.h,
                ),
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
                          Get.to(DetailAttachmentScreen(leaveModel.attachment));
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
                  controller.giveDecision("Approved", leaveModel.approvalId,
                      leaveModel.submissionAttributeId);
                },
                child: Text(
                  "Approve",
                  style: TextStyle(fontSize: 14.sp, color: Colors.white),
                )),
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
                    side: BorderSide(color: Colors.red),
                    primary: Colors.red),
                onPressed: () {
                  controller.giveDecision("Rejected", leaveModel.approvalId,
                      leaveModel.submissionAttributeId);
                },
                child: Text(
                  "Disapprove",
                  style: TextStyle(fontSize: 14.sp, color: Colors.white),
                )),
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
                    primary: Colors.black),
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  "Back",
                  style: TextStyle(fontSize: 14.sp, color: Colors.white),
                )),
          ),
          SizedBox(
            height: 2.h,
          )
        ],
      ),
    );
  }
}
