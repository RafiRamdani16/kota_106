import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:sizer/sizer.dart';

class DetailAttachmentScreen extends StatelessWidget {
  final String photoName;
  const DetailAttachmentScreen(this.photoName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Detail Attachment',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
      ),
      body: Container(
        constraints: BoxConstraints.expand(height: Get.height),
        child: PhotoView(
          imageProvider: NetworkImage(
              "https://62fe-2001-448a-304b-15a6-14bf-8f81-47ae-195d.ngrok.io/$photoName"),
          enableRotation: true,
        ),
      ),
    );
  }
}
