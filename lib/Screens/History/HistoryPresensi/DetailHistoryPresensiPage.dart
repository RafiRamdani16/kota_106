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
    // var screenHeightSize = MediaQuery.of(context).size.height;
    return Container(
      child: Wrap(
        direction: Axis.vertical,
        spacing: 10,
        runSpacing: 10,
        children: [
          Text('Check-in Time: '),
          Text('Check-out Time: '),
          Text('Work Time: '),
          Text('Check-in Location: '),
          TextFormField(
            decoration: InputDecoration(fillColor: Colors.white, filled: true),
            style: TextStyle(fontSize: 12),
            maxLines: 4,
            controller: location,
          ),
          Text('Check-out Location: '),
          TextFormField(
            decoration: InputDecoration(fillColor: Colors.white, filled: true),
            style: TextStyle(fontSize: 12),
            maxLines: 4,
            controller: location,
          ),
          Wrap(
            direction: Axis.horizontal,
            runSpacing: 20,
            children: [
              Wrap(
                direction: Axis.vertical,
                runSpacing: 10,
                children: [
                  Text('Check-in Photo:'),
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: controller.setImageView('namaUser'),
                            fit: BoxFit.cover)),
                  )
                ],
              ),
              Wrap(
                direction: Axis.vertical,
                runSpacing: 10,
                children: [
                  Text('Check-in Date: '),
                  Text('18 Agustus 2022'),
                  Text('Check-out Date'),
                  Text('18 Agustus 2022'),
                ],
              )
            ],
          ),
          TextFormField(
            decoration: InputDecoration(fillColor: Colors.white, filled: true),
            style: TextStyle(fontSize: 12),
            maxLines: 4,
            controller: doneList,
          ),
        ],
      ),
    );
  }
}
