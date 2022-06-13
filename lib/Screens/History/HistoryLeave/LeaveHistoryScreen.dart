import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kota_106/Controllers/HistoryController.dart';
import 'package:kota_106/Screens/History/HistoryLeave/DetailLeaveHistoryScreen.dart';
import 'package:sizer/sizer.dart';
import '../HistoryScreen.dart';

class LeaveHistoryScreen extends GetView<HistoryController> {
  const LeaveHistoryScreen({Key? key}) : super(key: key);
  
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
          onPressed: () {
            Get.to(HistoryScreen());
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.getLeaveHistory(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasError)
            return displayHistory();
          else
            return displayHistory();
        }
      },
    );
  }

  Wrap displayHistory() {
    return Wrap(
      direction: Axis.vertical,
      runSpacing: 10,
      spacing: 10,
      children: [
        AnimationLimiter(
            child: SizedBox(
                width: Get.width,
                height: Get.height - 25.h,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: controller.leaveHistory.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (controller.leaveHistory.length < 1) {
                      return Container(
                          child: Center(
                        child: Text(
                          "Tidak Ada Riwayat",
                          style: TextStyle(
                              fontFamily: 'ROBOTO',
                              fontSize: 20,
                              color: Colors.red),
                        ),
                      ));
                    }
                    controller.formatDate(
                        controller.leaveHistory[index].leaveDateSubmitted);
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
                                    Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      spacing: 20,
                                      runSpacing: 10,
                                      direction: Axis.vertical,
                                      children: [
                                        Text(
                                          "Leave",
                                          style: TextStyle(fontSize: 10.sp),
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
                                                      return DetailLeaveHistoryScreen(
                                                          controller
                                                                  .leaveHistory[
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
                                    Container(
                                      width: 20.w,
                                      height: 2.h,
                                      decoration: BoxDecoration(
                                          color: controller.checkStatus(
                                              controller.leaveHistory[index]
                                                  .leaveStatus),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Text(
                                        controller
                                            .leaveHistory[index].leaveStatus,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
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
