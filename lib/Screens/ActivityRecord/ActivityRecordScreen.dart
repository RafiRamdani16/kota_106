import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kota_106/Controllers/ActivityRecordController.dart';
import 'package:kota_106/Screens/ActivityRecord/ActivityRecordWidget/HistoryActivityRecord.dart';

class ActivityRecordScreen extends GetView<ActivityRecordController> {
  const ActivityRecordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeightSize = MediaQuery.of(context).size.height;
    var screenWidthSize = MediaQuery.of(context).size.width;
    List<Widget> tabs = <Widget>[
      Container(color: Colors.white, child: Tab(text: 'History')),
    ];
    
    controller.currentDate();
    controller.getLocationActivityRecord();
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('FCBC45'),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Activity Record',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.toNamed('/');
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: screenHeightSize,
          width: screenWidthSize,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/BackgroundProfile.jpg"),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 15,
                    child: DefaultTabController(
                      length: 1,
                      initialIndex: 0,
                      child: Card(
                        child: Column(
                          children: [
                            Container(
                              color: Colors.white,
                              child: TabBar(
                                indicatorColor: Colors.amberAccent,
                                tabs: tabs,
                                labelColor: Colors.black,
                              ),
                            ),
                            Container(
                              height: screenHeightSize - 260,
                              width: screenWidthSize,
                              child: TabBarView(
                                  children: [HistoryActivityRecord()]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 350,
                    height: 40,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            elevation: 10,
                            primary: HexColor("363636")),
                        onPressed: () {
                          Get.toNamed('/addActivityRecord');
                        },
                        child: Text(
                          "New Activity",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 16,
                              color: Colors.white),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
