import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

import 'LeaveApproval/LeaveApprovalList/LeaveApprovalScreen.dart';
import 'OvertimeApproval/OvertimeApprovalList/OvertimeApplicationScreen.dart';
import 'PermitApproval/PermitApprovalList/PermitApprovalScreen.dart';

class ApprovalScreen extends StatelessWidget {
  const ApprovalScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = <Widget>[
      Container(width: 70, child: Tab(text: 'Overtime')),
      Container(width: 70, child: Tab(text: 'Permit')),
      Container(width: 70, child: Tab(text: 'Leave')),
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Approval',
            style: TextStyle(fontSize: 20.sp, color: Colors.black)),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Wrap(
          spacing: 10,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(bottom: 10)),
            Center(
              child: TabBar(
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.amberAccent,
                tabs: tabs,
                unselectedLabelColor: Colors.black,
                labelColor: Colors.amberAccent,
              ),
            ),
            Container(
              color: HexColor('F5F5F5'),
              height: Get.height - 170,
              width: Get.width,
              child: TabBarView(children: [
                OvertimeApplicationScreen(),
                PermitApprovalScreen(),
                LeaveApprovalScreen()
              ]),
            )
          ],
        ),
      ),
    );
  }
}
