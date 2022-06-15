import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kota_106/Submission/Permit/PermitModel.dart';

import 'package:sizer/sizer.dart';
import '../../../DetailAttachmentScreen.dart';
import '../../HistoryController.dart';
import '../EditPermitHistoryScreen.dart';

class DetailPermitHistoryScreen extends GetView<HistoryController> {
  final PermitModel permitModel;
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
                          'Date Submitted:  ${DateFormat('dd MMMM yyyy').format(DateTime.parse(permitModel.dateSubmit))} ',
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        // Text(
                        //   'Time Submitted:  ${permitModel.permitTimeSubmitted} ',
                        //   style: TextStyle(fontSize: 12.sp),
                        // ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          'Permit Date:  ${DateFormat('dd MMMM yyyy').format(DateTime.parse(permitModel.datePermit))}',
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
                          Get.to(DetailAttachmentScreen("TestingSuketSakit2"));
                        },
                        child: Text(
                          "See Full Attachment",
                          style:
                              TextStyle(fontSize: 14.sp, color: Colors.white),
                        )),
                  ),
                ),
                // Row(
                //   children: [
                //     Text(permitModel.usernameApproval1),
                //     SizedBox(width: 20.w),
                //     Container(
                //       width: 20.w,
                //       height: 2.h,
                //       decoration: BoxDecoration(
                //           color: controller
                //               .checkStatus(permitModel.statusApproval1),
                //           borderRadius: BorderRadius.circular(10)),
                //       child: Text(
                //         permitModel.statusApproval1,
                //         textAlign: TextAlign.center,
                //         style: TextStyle(color: Colors.white),
                //       ),
                //     ),
                //   ],
                // ),
                // Visibility(
                //     visible: controller.isHR(),
                //     child: Row(
                //       children: [
                //         Text(permitModel.usernameApproval2),
                //         SizedBox(width: 20.w),
                //         Container(
                //           width: 20.w,
                //           height: 2.h,
                //           decoration: BoxDecoration(
                //               color: controller
                //                   .checkStatus(permitModel.statusApproval2),
                //               borderRadius: BorderRadius.circular(10)),
                //           child: Text(
                //             permitModel.statusApproval3,
                //             textAlign: TextAlign.center,
                //             style: TextStyle(color: Colors.white),
                //           ),
                //         ),
                //       ],
                //     )),
                // Visibility(
                //     visible: controller.isAtasan(),
                //     child: Row(
                //       children: [
                //         Text(permitModel.usernameApproval3),
                //         SizedBox(width: 20.w),
                //         Container(
                //           width: 20.w,
                //           height: 2.h,
                //           decoration: BoxDecoration(
                //               color: controller.checkStatus(
                //                   permitModel.statusApproval3),
                //               borderRadius: BorderRadius.circular(10)),
                //           child: Text(
                //             permitModel.statusApproval3,
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
                  Get.to(EditPermitHistoryScreen(permitModel.permitId));
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
