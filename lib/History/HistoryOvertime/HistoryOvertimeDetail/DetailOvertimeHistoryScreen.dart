import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kota_106/History/HistoryController.dart';
import 'package:kota_106/Submission/AfterOvertime/AfterOvertimeScreen.dart';

import 'package:sizer/sizer.dart';

import '../../../Submission/SubmissionModel.dart';
import '../EditOvertimeScreen.dart';

class DetailOvertimeHistory extends GetView<HistoryController> {
  final SubmissionModel overtimeModel;
  const DetailOvertimeHistory(this.overtimeModel);

  @override
  Widget build(BuildContext context) {
    controller.description.text = overtimeModel.description;
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
                          'Date Submitted:  ${DateFormat('dd MMMM yyyy').format(DateTime.parse(overtimeModel.dateSubmit))} ',
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          'Time Submitted:  ${DateFormat('HH:mm').format(DateTime.parse(overtimeModel.dateSubmit).toLocal())} ',
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          'Overtime Date:  ${DateFormat('dd MMMM yyyy').format(DateTime.parse(overtimeModel.datePerform))}',
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
                                  overtimeModel.startTime,
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
                                  overtimeModel.endTime,
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
                SizedBox(
                  height: 2.h,
                ),
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: overtimeModel.historyApprovals.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(top: 2.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                overtimeModel.historyApprovals[index].userName),
                            // SizedBox(
                            //   width: 20.w,
                            // ),
                            Container(
                              width: 20.w,
                              height: 2.h,
                              decoration: BoxDecoration(
                                  color: controller.checkStatus(overtimeModel
                                      .historyApprovals[index].statusApproval),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                overtimeModel
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
                //         "Admin:  ${overtimeModel.historyApprovals[0].userName}          "),
                //     Container(
                //       width: 20.w,
                //       height: 2.h,
                //       decoration: BoxDecoration(
                //           color: controller.checkStatus(
                //               overtimeModel.historyApprovals[0].statusApproval),
                //           borderRadius: BorderRadius.circular(10)),
                //       child: Text(
                //         overtimeModel.historyApprovals[0].statusApproval,
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
                //             "HR:  ${overtimeModel.historyApprovals[1].userName}          "),
                //         Container(
                //           width: 20.w,
                //           height: 2.h,
                //           decoration: BoxDecoration(
                //               color: controller.checkStatus(overtimeModel
                //                   .historyApprovals[1].statusApproval),
                //               borderRadius: BorderRadius.circular(10)),
                //           child: Text(
                //             overtimeModel.historyApprovals[1].statusApproval,
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
                //             "Atasan:  ${overtimeModel.historyApprovals[2].userName}          "),
                //         Container(
                //           width: 20.w,
                //           height: 2.h,
                //           decoration: BoxDecoration(
                //               color: controller.checkStatus(overtimeModel
                //                   .historyApprovals[2].statusApproval),
                //               borderRadius: BorderRadius.circular(10)),
                //           child: Text(
                //             overtimeModel.historyApprovals[2].statusApproval,
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
                    primary: Colors.white),
                onPressed: () {
                  Get.to(EditOvertimeScreen(overtimeModel));
                },
                child: Text(
                  "Edit Overtime Data",
                  style: TextStyle(fontSize: 14.sp, color: Colors.amber),
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
                      side: BorderSide(color: Colors.amber),
                      primary: Colors.amber),
                  onPressed: () {
                    print(overtimeModel.submissionId);
                    Get.to(AfterOvertimeScreen(overtimeModel.submissionId));
                  },
                  child: Text(
                    "Form After Overtime",
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
                  onPressed: () async {
                    await controller.getAfterOvertimeHistory(
                        overtimeModel.submissionId, context);
                   
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
