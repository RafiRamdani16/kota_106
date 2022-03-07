import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kota_106/Controllers/AttendanceController/HistoryAttendanceController.dart';

class DetailHistoryPresensiPage extends StatelessWidget {
  const DetailHistoryPresensiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController location = TextEditingController();
    TextEditingController doneList = TextEditingController();
    HistoryAttendanceController controller =
        Get.put(HistoryAttendanceController());
    var screenHeightSize = MediaQuery.of(context).size.height;
    var screenWidthSize = MediaQuery.of(context).size.width;    

    return Center(
      child: AspectRatio(
        aspectRatio: 100 / 100,
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/backgroundDetailHistory.png"),
                      fit: BoxFit.cover)),
              width: screenWidthSize,
              height: screenHeightSize,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Check-in Time: '),
                  Text('Check-out Time: '),
                  Text('Work Time: '),
                  Text('Check-in Location: '),
                  TextFormField(
                    enabled: false,
                    decoration: InputDecoration(
                        fillColor: Colors.white, filled: true),
                    style: TextStyle(fontSize: 12),
                    maxLines: 4,
                    controller: location,
                  ),
                  Text('Check-out Location: '),
                  TextFormField(
                    enabled: false,
                    decoration: InputDecoration(
                        fillColor: Colors.white, filled: true),
                    style: TextStyle(fontSize: 12),
                    maxLines: 4,
                    controller: location,
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    spacing: 50,
                    children: [
                      Wrap(
                        direction: Axis.vertical,
                        runSpacing: 10,
                        spacing: 20,
                        children: [
                          Text('Check-in Photo:'),
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        controller.setImageView('namaUser'),
                                    fit: BoxFit.cover)),
                          )
                        ],
                      ),
                      Wrap(
                        direction: Axis.vertical,
                        runSpacing: 10,
                        spacing: 20,
                        children: [
                          Text('Check-in Date: '),
                          Text('  18 Agustus 2022'),
                          Text('Check-out Date'),
                          Text('  18 Agustus 2022'),
                        ],
                      )
                    ],
                  ),
                  Text('Done List'),
                  TextFormField(
                    enabled: false,
                    decoration: InputDecoration(
                        fillColor: Colors.white, filled: true),
                    style: TextStyle(fontSize: 12),
                    maxLines: 4,
                    controller: doneList,
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
