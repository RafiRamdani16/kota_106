import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import 'package:kota_106/Controllers/HistoryController.dart';
import 'package:kota_106/Screens/ActivityRecord/ActivityRecordWidget/DetailActivityRecordScreen.dart';

class HistoryActivityRecord extends GetView<HistoryController> {
  const HistoryActivityRecord({Key? key}) : super(key: key);

  Scaffold errorView() {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Center(
            child: Text(
          "Tidak Ada Riwayat",
          style: TextStyle(fontSize: 12),
        )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.getHistoryActivityRecord(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
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
                width: Get.width - (Get.width / 6) ,
                height: Get.height,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: controller.activityRecordHistory.length,
                  itemBuilder: (BuildContext context, int index) {
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
                                padding: EdgeInsets.only( left: 10.0),
                                child: Wrap(
                                  direction: Axis.horizontal,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: [
                                    controller.setImageView('namaUser'),
                                    // Obx((() {
                                    //   return Container(
                                    //     height: 20,
                                    //     width: 20,
                                    //     decoration: BoxDecoration(
                                    //         image: DecorationImage(
                                    //             image: controller
                                    //                 .setImageView('namaUser'),
                                    //             fit: BoxFit.cover)),
                                    //   );
                                    // })),
                                    Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      spacing: 5,
                                      runSpacing: 10,
                                      direction: Axis.vertical,
                                      children: [
                                        Text(
                                          "testing",
                                          style: TextStyle(
                                              fontFamily: 'ROBOTO',
                                              fontSize: 12),
                                        ),
                                        Text(
                                          "testing",
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
                                                Get.to(DetailActivityRecordScreen(
                                                    controller
                                                            .activityRecordHistory[
                                                        index]));
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
