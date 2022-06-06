import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kota_106/Controllers/PermitDecisionApplicationController.dart';
import 'package:kota_106/Models/PermitApplicationDecisionModel.dart';

import 'package:sizer/sizer.dart';

import '../../DetailAttachmentScreen.dart';

class PermitApplicationScreenDetail
    extends GetView<PermitDecisionApplicationController> {
  final PermitApplicationDecisionModel permitModel;
  const PermitApplicationScreenDetail(this.permitModel);

  @override
  Widget build(BuildContext context) {
    controller.permitDescription.value = permitModel.permitDescription;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 2.h,
          ),
          Text(
            'Permit Application Detail',
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
                          'Date Submitted:  ${DateFormat('dd MMMM yyyy').format(DateTime.parse(permitModel.permitDateSubmitted))} ',
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          'Time Submitted:  ${permitModel.permitTimeSubmitted} ',
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          'Permit Date:  ${DateFormat('dd MMMM yyyy').format(DateTime.parse(permitModel.permitDate))}',
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
                                  permitModel.permitStartTime,
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
                                  permitModel.permitEndTime,
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
                  controller.permitDescription.value,
                  style: TextStyle(fontSize: 12.sp),
                ),
                // TextFormField(
                //   enabled: false,
                //   decoration:
                //       InputDecoration(fillColor: Colors.white, filled: true),
                //   style: TextStyle(fontSize: 12.sp),
                //   maxLines: 4,
                //   controller: controller.permitDescription.value,
                // ),
                SizedBox(height: 4.h),
                Text(
                  'Attachment:',
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Center(
                  child: controller.setImageView(
                      permitModel.permitAttachment, 200, 100, "Permit"),
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
                onPressed: () {},
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
                onPressed: () {},
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
