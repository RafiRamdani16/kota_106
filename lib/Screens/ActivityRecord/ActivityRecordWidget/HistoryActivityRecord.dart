import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:kota_106/Controllers/ActivityRecordController.dart';
import 'package:kota_106/Screens/ActivityRecord/DetailActivityRecordScreen.dart';

class HistoryActivityRecord extends GetView<ActivityRecordController> {
  const HistoryActivityRecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeightSize = MediaQuery.of(context).size.height;
    var screenWidthSize = MediaQuery.of(context).size.width;
    controller.scrollController = new ScrollController()
      ..addListener(controller.loadMoreHistory);
    return controller.isFirstLoading.value == false
        ? CircularProgressIndicator()
        : Scaffold(
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
                                        elevation: 0,
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
                                              Obx((() {
                                                return controller
                                                    .setImageView();
                                              })),
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
                                                    controller.history[index].time,
                                                    style: TextStyle(
                                                        fontFamily: 'ROBOTO',
                                                        fontSize: 12),
                                                  ),
                                                  Text(
                                                    controller.history[index].date,
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
                                                          Get.to(DetailActivityRecordScreen(
                                                              controller
                                                                      .history[
                                                                  index]));
                                                        },
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              'DETAIL',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'ROBOTO',
                                                                  fontSize: 10,
                                                                  color: Colors
                                                                      .amber),
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .expand_more_outlined,
                                                              color:
                                                                  Colors.amber,
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
                            padding: const EdgeInsets.only(top: 10, bottom: 40),
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
                            padding: const EdgeInsets.only(top: 30, bottom: 40),
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
          );
  }
}
