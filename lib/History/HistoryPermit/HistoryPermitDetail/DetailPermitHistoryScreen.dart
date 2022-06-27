import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:sizer/sizer.dart';
import '../../../DetailAttachmentScreen.dart';
import '../../../Submission/SubmissionModel.dart';
import '../../HistoryController.dart';
import '../EditPermitHistoryScreen.dart';

class DetailPermitHistoryScreen extends GetView<HistoryController> {
  final SubmissionModel permitModel;
  const DetailPermitHistoryScreen(this.permitModel);

  @override
  Widget build(BuildContext context) {
    controller.description.text = permitModel.description;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 2.h,
          ),
          Text(
            'Permit Detail',
            style: TextStyle(fontSize: 14.sp),
          ),
          Container(
            padding: EdgeInsets.only(left: 5.w),
            width: Get.width,
            height: 90.h,
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
                          'Date Submitted:  ${DateFormat('dd MMMM yyyy').format(DateTime.parse(permitModel.dateSubmit))} ',
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          'Time Submitted:  ${DateFormat('HH:mm').format(DateTime.parse(permitModel.dateSubmit).toLocal())} ',
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          'Permit Date:  ${DateFormat('dd MMMM yyyy').format(DateTime.parse(permitModel.datePerform))}',
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
                                  style: TextStyle(fontSize: 13.sp),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  permitModel.startTime,
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
                                  style: TextStyle(fontSize: 13.sp),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  permitModel.endTime,
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
                Text(
                  'Attachment:',
                  style: TextStyle(fontSize: 12.sp),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Center(
                  child: controller.setImageView(
                      permitModel.attachment, 200, 100, "Permit"),
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
                          Get.to(DetailAttachmentScreen(permitModel.attachment));
                        },
                        child: Text(
                          "See Full Attachment",
                          style:
                              TextStyle(fontSize: 14.sp, color: Colors.white),
                        )),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: permitModel.historyApprovals.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(top: 2.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(permitModel.historyApprovals[index].userName),
                            // SizedBox(
                            //   width: 20.w,
                            // ),
                            Container(
                              width: 20.w,
                              height: 2.h,
                              decoration: BoxDecoration(
                                  color: controller.checkStatus(permitModel
                                      .historyApprovals[index].statusApproval),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                permitModel
                                    .historyApprovals[index].statusApproval,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                // Row(
                //   children: [
                //     Text(
                //         "Admin: ${permitModel.historyApprovals[0].userName}          "),
                //     Container(
                //       width: 20.w,
                //       height: 2.h,
                //       decoration: BoxDecoration(
                //           color: controller.checkStatus(
                //               permitModel.historyApprovals[0].statusApproval),
                //           borderRadius: BorderRadius.circular(10)),
                //       child: Text(
                //         permitModel.historyApprovals[0].statusApproval,
                //         textAlign: TextAlign.center,
                //         style: TextStyle(color: Colors.white),
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(
                //   height: 2.h,
                // ),
                // Visibility(
                //     visible: controller.isHR(),
                //     child: Row(
                //       children: [
                //         Text(
                //             "HR:  ${permitModel.historyApprovals[1].userName}          "),
                //         Container(
                //           width: 20.w,
                //           height: 2.h,
                //           decoration: BoxDecoration(
                //               color: controller.checkStatus(permitModel
                //                   .historyApprovals[1].statusApproval),
                //               borderRadius: BorderRadius.circular(10)),
                //           child: Text(
                //             permitModel.historyApprovals[1].statusApproval,
                //             textAlign: TextAlign.center,
                //             style: TextStyle(color: Colors.white),
                //           ),
                //         ),
                //       ],
                //     )),
                // SizedBox(
                //   height: 2.h,
                // ),
                // Visibility(
                //     visible: controller.isAtasan(),
                //     child: Row(
                //       children: [
                //         Text(
                //             "Atasan:  ${permitModel.historyApprovals[2].userName}          "),
                //         Container(
                //           width: 20.w,
                //           height: 2.h,
                //           decoration: BoxDecoration(
                //               color: controller.checkStatus(permitModel
                //                   .historyApprovals[2].statusApproval),
                //               borderRadius: BorderRadius.circular(10)),
                //           child: Text(
                //             permitModel.historyApprovals[2].statusApproval,
                //             textAlign: TextAlign.center,
                //             style: TextStyle(color: Colors.white),
                //           ),
                //         ),
                //       ],
                //     ))
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
                    primary: Colors.amber),
                onPressed: () {
                  Get.to(EditPermitHistoryScreen(permitModel));
                },
                child: Text(
                  "Edit Permit Data",
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
