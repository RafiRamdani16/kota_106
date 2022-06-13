import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:kota_106/Controllers/HistoryController.dart';

import '../HistoryScreen.dart';
import 'DetailHistoryActivityRecordScreen.dart';

class HistoryActivityRecord extends GetView<HistoryController> {
  
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
      future: controller.activityRecordHistory(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasError)
            return errorView();
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
                height: Get.height,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: controller.activityRecordHistoryList.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (controller.activityRecordHistoryList.length < 1) {
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
                    controller.changeFormatDateForActivityHistory(
                        controller.activityRecordHistoryList[index].date);
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
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: [
                                    Card(
                                      elevation: 15,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      clipBehavior: Clip.antiAlias,
                                      child: Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        direction: Axis.vertical,
                                        spacing: 10,
                                        runSpacing: 10,
                                        children: [
                                          Container(
                                            width: 60,
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
                                      spacing: 5,
                                      runSpacing: 10,
                                      direction: Axis.vertical,
                                      children: [
                                        Text(
                                          "Activity Record",
                                          style: TextStyle(
                                              fontFamily: 'ROBOTO',
                                              fontSize: 12),
                                        ),
                                        Text(
                                          controller.activityRecordTime.value,
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
                                                      return DetailActivityRecordScreen(
                                                          controller
                                                                  .activityRecordHistoryList[
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
