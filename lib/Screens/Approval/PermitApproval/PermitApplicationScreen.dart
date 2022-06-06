import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kota_106/Controllers/PermitDecisionApplicationController.dart';
import 'package:sizer/sizer.dart';

import 'PermitApplicationScreenDetail.dart';

class PermitApplicationScreen
    extends GetView<PermitDecisionApplicationController> {
  const PermitApplicationScreen({Key? key}) : super(key: key);
  Widget errorView() {
    return AlertDialog(
      title: const Text('ALERT'),
      content: SingleChildScrollView(
        child: ListBody(
          children: const <Widget>[
            Text('Terjadi Kesalahan Koneksi'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text(
            'Refresh',
            style: TextStyle(color: Colors.red),
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.getPermitApplication(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasError)
            return displayListApplication();
          else
            return displayListApplication();
        }
      },
    );
  }

  Wrap displayListApplication() {
    return Wrap(
      direction: Axis.vertical,
      runSpacing: 10,
      spacing: 10,
      children: [
        AnimationLimiter(
            child: SizedBox(
                width: Get.width,
                height: Get.height,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: controller.permitApplication.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (controller.permitApplication.length < 1) {
                      return Container(
                          child: Center(
                        child: Text(
                          "Tidak Ada Pengajuan Izin",
                          style: TextStyle(
                              fontFamily: 'ROBOTO',
                              fontSize: 20,
                              color: Colors.red),
                        ),
                      ));
                    }
                    controller.formatDate(controller
                        .permitApplication[index].permitDateSubmitted);
                    return AnimationConfiguration.staggeredList(
                        position: index,
                        child: SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                              child: Container(
                            padding: EdgeInsets.only(
                                top: 10.0, left: 15.0, right: 10.0),
                            height: 120,
                            width: Get.width,
                            child: Card(
                              elevation: 15,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              clipBehavior: Clip.antiAlias,
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.0, top: 20),
                                child: Wrap(
                                  direction: Axis.horizontal,
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: [
                                    Card(
                                      elevation: 15,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(17)),
                                      clipBehavior: Clip.antiAlias,
                                      child: Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        direction: Axis.vertical,
                                        runSpacing: 10,
                                        children: [
                                          Container(
                                            width: 60,
                                            height: 20,
                                            color: HexColor('463F3A'),
                                            child: Text(
                                              '${controller.month}',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Container(
                                            height: 40,
                                            width: 60,
                                            child: Text(
                                              '${controller.day}',
                                              style: TextStyle(
                                                  fontSize: 28,
                                                  backgroundColor:
                                                      Colors.white),
                                              textAlign: TextAlign.center,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.permitApplication[index]
                                              .employeeName,
                                          style: TextStyle(fontSize: 10.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 0.5.h,
                                        ),
                                        Text(
                                          controller.permitApplication[index]
                                              .employeePosition,
                                          style: TextStyle(fontSize: 10.sp),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Container(
                                          height: 25,
                                          width: 90,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0)),
                                                  elevation: 7,
                                                  side: BorderSide(
                                                      color:
                                                          Colors.amberAccent),
                                                  primary: Colors.white),
                                              onPressed: () {
                                                showModalBottomSheet(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return PermitApplicationScreenDetail(
                                                          controller
                                                                  .permitApplication[
                                                              index]);
                                                    });
                                              },
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'DETAIL',
                                                    style: TextStyle(
                                                        fontFamily: 'ROBOTO',
                                                        fontSize: 10,
                                                        color: Colors.amber),
                                                  ),
                                                  Icon(
                                                    Icons.expand_more_outlined,
                                                    color: Colors.amber,
                                                  )
                                                ],
                                              )),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    // Container(
                                    //   width: 20.w,
                                    //   height: 2.h,
                                    //   decoration: BoxDecoration(
                                    //       color: controller.checkStatus(
                                    //           controller.leaveHistory[index]
                                    //               .leaveStatus),
                                    //       borderRadius:
                                    //           BorderRadius.circular(10)),
                                    //   child: Text(
                                    //     controller
                                    //         .leaveHistory[index].leaveStatus,
                                    //     textAlign: TextAlign.center,
                                    //     style: TextStyle(color: Colors.white),
                                    //   ),
                                    // )
                                  ],
                                ),
                              ),
                            ),
                          )),
                        ));
                  },
                ))),
      ],
    );
  }
}
