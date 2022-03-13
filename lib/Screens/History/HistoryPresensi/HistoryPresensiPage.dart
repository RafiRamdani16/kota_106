import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kota_106/Controllers/AttendanceController/AttendanceController.dart';
import 'package:kota_106/Controllers/AttendanceController/HistoryAttendanceController.dart';
import 'DetailHistoryPresensiPage.dart';

class HistoryPresensiPage extends GetView<HistoryAttendanceController> {
  const HistoryPresensiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AttendanceController attendancecontroller = Get.put(AttendanceController());
    String nameMonth = attendancecontroller.nameMonth.value;
    var screenHeightSize = MediaQuery.of(context).size.height;
    var screenWidthSize = MediaQuery.of(context).size.width;

    return Obx(() => controller.isFirstLoading.value == false
        ? CircularProgressIndicator()
        : AspectRatio(
            aspectRatio: 100 / 100,
            child: Scaffold(
              body: Container(
                width: screenWidthSize,
                height: screenHeightSize,
                child: Wrap(
                  direction: Axis.vertical,
                  runSpacing: 10,
                  spacing: 10,
                  children: [
                    AnimationLimiter(
                        child: SizedBox(
                            width: screenWidthSize,
                            height: screenHeightSize,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              controller: controller.scrollController,
                              itemCount: controller.history.length,
                              itemBuilder: (BuildContext context, int index) {
                                controller.currentCheckinDate(
                                    controller.history[index].checkinAt);
                                controller.currentCheckOutDate(
                                    controller.history[index].checkoutAt);
                                return AnimationConfiguration.staggeredList(
                                    position: index,
                                    child: SlideAnimation(
                                      verticalOffset: 50.0,
                                      child: FadeInAnimation(
                                          child: Container(
                                        padding: EdgeInsets.only(
                                            top: 10.0, left: 15.0, right: 10.0),
                                        height: 120,
                                        width: screenWidthSize,
                                        child: Card(
                                          elevation: 15,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          clipBehavior: Clip.antiAlias,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 10.0, left: 10.0),
                                            child: Wrap(
                                              direction: Axis.horizontal,
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.center,
                                              spacing: 10,
                                              runSpacing: 10,
                                              children: [
                                                Card(
                                                  elevation: 15,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  clipBehavior: Clip.antiAlias,
                                                  child: Wrap(
                                                    crossAxisAlignment:
                                                        WrapCrossAlignment
                                                            .center,
                                                    direction: Axis.vertical,
                                                    spacing: 10,
                                                    runSpacing: 10,
                                                    children: [
                                                      Container(
                                                        width: 60,
                                                        color:
                                                            HexColor('463F3A'),
                                                        child: Text(
                                                          '${controller.month}',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 12),
                                                          textAlign:
                                                              TextAlign.center,
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
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Wrap(
                                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.start,
                                                  spacing: 5,
                                                  runSpacing: 10,
                                                  direction: Axis.vertical,
                                                  children: [
                                                    Text(
                                                      'Daily Attendance',
                                                      style: TextStyle(
                                                          fontFamily: 'ROBOTO',
                                                          fontSize: 12),
                                                    ),
                                                    Text(
                                                      'Work time: ${controller.workingTime}',
                                                      style: TextStyle(
                                                          fontFamily: 'ROBOTO',
                                                          fontSize: 12),
                                                    ),
                                                    Container(
                                                      height: 25,
                                                      width: 90,
                                                      child: ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20.0)),
                                                              elevation: 7,
                                                              side: BorderSide(
                                                                  color: Colors
                                                                      .amberAccent),
                                                              primary:
                                                                  Colors.white),
                                                          onPressed: () {
                                                            showModalBottomSheet(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                                  return DetailHistoryPresensiPage(
                                                                    controller
                                                                            .history[
                                                                        index],
                                                                  );
                                                                });
                                                          },
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                'DETAIL',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'ROBOTO',
                                                                    fontSize:
                                                                        10,
                                                                    color: Colors
                                                                        .amber),
                                                              ),
                                                              Icon(
                                                                Icons
                                                                    .expand_more_outlined,
                                                                color: Colors
                                                                    .amber,
                                                              )
                                                            ],
                                                          )),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )),
                                    ));
                              },
                            ))),
                    Obx(() {
                      return controller.isLoadMoreRunning.value == true
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 40),
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : Container();
                    }),

                    // When nothing else to load
                    Obx(() {
                      return controller.hasNextPage.value == false
                          ? Container(
                              padding:
                                  const EdgeInsets.only(top: 30, bottom: 40),
                              color: Colors.amber,
                              child: Center(
                                child:
                                    Text('You have fetched all of the content'),
                              ),
                            )
                          : Container();
                    })
                  ],
                ),
              ),
            ),
          ));
  }
}
