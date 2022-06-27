// ignore_for_file: body_might_complete_normally_nullable

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kota_106/Profile/ProfileController.dart';

class EditProfileScreen extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    double fontSize = 12.sp;
    double headFontSize = 14.sp;
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('FCBC45'),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Edit Data Employee',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.toNamed('/profileScreen');
          },
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/BackgroundProfile.jpg"),
                  fit: BoxFit.fill)),
          width: Get.width,
          height: 80.h,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17)),
                  elevation: 2,
                  child: Container(
                    padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 5.w),
                    height: 70.h,
                    width: Get.width,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.image),
                                        suffixIcon: IconButton(
                                          icon: Icon(Icons.upload),
                                          onPressed: () {
                                            controller.uploadButton(context);
                                          },
                                        ),
                                        hintText: "Upload Photo Profile....",
                                        fillColor: Colors.white,
                                        filled: true),
                                    style: TextStyle(fontSize: fontSize),
                                    maxLines: 1,
                                    controller: controller.editPhotoName,
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                  'Name',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: headFontSize),
                                ),
                                Container(
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  child: TextFormField(
                                    validator: (value) {
                                      RegExp regx = RegExp(r"^[a-z_ ]*$",
                                          caseSensitive: false);
                                      if (value == "") {
                                        return "Name Can't Be Empty";
                                      } else if (!(regx.hasMatch(value!))) {
                                        return "Name Can Only Use Letters";
                                      }
                                    },
                                    decoration: InputDecoration(
                                        fillColor: Colors.white, filled: true),
                                    style: TextStyle(fontSize: fontSize),
                                    maxLines: 1,
                                    controller: controller.name,
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                  'Gender',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: headFontSize),
                                ),
                                Container(
                                    width: Get.width,
                                    child: Obx(
                                      () {
                                        return DropdownButton<String>(
                                          isExpanded: true,
                                          icon: Icon(Icons.arrow_drop_down),
                                          value:
                                              controller.selectedGender.value,
                                          onChanged: (String? value) {
                                            controller.selectedGender.value =
                                                value!;
                                          },
                                          items: <DropdownMenuItem<String>>[
                                            DropdownMenuItem(
                                              child: Text(
                                                "Pria",
                                                style:
                                                    TextStyle(fontSize: 11.sp),
                                              ),
                                              value: "Pria",
                                            ),
                                            DropdownMenuItem(
                                              child: Text("Wanita",
                                                  style: TextStyle(
                                                      fontSize: 11.sp)),
                                              value: "Wanita",
                                            ),
                                          ],
                                        );
                                      },
                                    )),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  'Email',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: headFontSize),
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Container(
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  child: TextFormField(
                                    validator: (value) {
                                      bool isvalid = EmailValidator.validate(
                                          value.toString());
                                      if (value == "") {
                                        return "Email Can't Be Empty";
                                      } else if (!isvalid) {
                                        return "Email is not valid";
                                      }
                                    },
                                    decoration: InputDecoration(
                                        fillColor: Colors.white, filled: true),
                                    style: TextStyle(fontSize: fontSize),
                                    maxLines: 1,
                                    controller: controller.email,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  'No KTP',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: headFontSize),
                                ),
                                Container(
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  child: TextFormField(
                                    validator: (value) {
                                      RegExp regx = RegExp(r"^[0-9_]*$",
                                          caseSensitive: false);
                                      if (value == "") {
                                        return "No KTP Can't Be Empty";
                                      } else if (!(regx.hasMatch(value!))) {
                                        return "No KTP Can Only Use Number";
                                      } else if (value.length < 16 ||
                                          value.length > 16) {
                                        return "No KTP maximimum miminum 16 digit";
                                      }
                                    },
                                    decoration: InputDecoration(
                                        fillColor: Colors.white, filled: true),
                                    style: TextStyle(fontSize: fontSize),
                                    maxLines: 1,
                                    controller: controller.noKTP,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  'NPWP',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: headFontSize),
                                ),
                                Container(
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == "") {
                                        return "NPWP Can't Be Empty";
                                      }
                                    },
                                    decoration: InputDecoration(
                                        fillColor: Colors.white, filled: true),
                                    style: TextStyle(fontSize: fontSize),
                                    maxLines: 1,
                                    controller: controller.npwp,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  'Religion',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: headFontSize),
                                ),
                                Container(
                                    width: Get.width,
                                    child: Obx(
                                      () {
                                        return DropdownButton<String>(
                                          isExpanded: true,
                                          icon: Icon(Icons.arrow_drop_down),
                                          value:
                                              controller.selectedReligion.value,
                                          onChanged: (String? value) {
                                            controller.selectedReligion.value =
                                                value!;
                                          },
                                          items: <DropdownMenuItem<String>>[
                                            DropdownMenuItem(
                                              child: Text(
                                                "Islam",
                                                style:
                                                    TextStyle(fontSize: 11.sp),
                                              ),
                                              value: "Islam",
                                            ),
                                            DropdownMenuItem(
                                              child: Text("Kristen",
                                                  style: TextStyle(
                                                      fontSize: 11.sp)),
                                              value: "Kristen",
                                            ),
                                            DropdownMenuItem(
                                              child: Text("Hindu",
                                                  style: TextStyle(
                                                      fontSize: 11.sp)),
                                              value: "Hindu",
                                            ),
                                            DropdownMenuItem(
                                              child: Text("Budha",
                                                  style: TextStyle(
                                                      fontSize: 11.sp)),
                                              value: "Budha",
                                            ),
                                            DropdownMenuItem(
                                              child: Text("Khonghucu",
                                                  style: TextStyle(
                                                      fontSize: 11.sp)),
                                              value: "Khonghucu",
                                            ),
                                          ],
                                        );
                                      },
                                    )),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  'Phone Number',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: headFontSize),
                                ),
                                Container(
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  child: TextFormField(
                                    validator: (value) {
                                      RegExp regx = RegExp(r"^[0-9_]*$",
                                          caseSensitive: false);
                                      if (value == "") {
                                        return "Phone Number Can't Be Empty";
                                      } else if (!(regx.hasMatch(value!))) {
                                        return "Phone Number Can Only Use Number";
                                      }
                                    },
                                    decoration: InputDecoration(
                                        fillColor: Colors.white, filled: true),
                                    style: TextStyle(fontSize: fontSize),
                                    maxLines: 1,
                                    controller: controller.phoneNumber,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  'City',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: headFontSize),
                                ),
                                Container(
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  child: TextFormField(
                                    validator: (value) {
                                      RegExp regx = RegExp(r"^[a-z_]*$",
                                          caseSensitive: false);
                                      if (value == "") {
                                        return "City Name Number Can't Be Empty";
                                      } else if (!(regx.hasMatch(value!))) {
                                        return "City Name Can Only Use Letters";
                                      }
                                    },
                                    decoration: InputDecoration(
                                        fillColor: Colors.white, filled: true),
                                    style: TextStyle(fontSize: fontSize),
                                    maxLines: 1,
                                    controller: controller.city,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  'Date of Birth',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: headFontSize),
                                ),
                                Container(
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == "") {
                                        return "Date of Birth Can't Be Empty";
                                      }
                                    },
                                    decoration: InputDecoration(
                                        fillColor: Colors.white, filled: true),
                                    style: TextStyle(fontSize: fontSize),
                                    maxLines: 1,
                                    controller: controller.dateOfBirth,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  'Address',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: headFontSize),
                                ),
                                Container(
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  child: TextFormField(
                                      validator: (value) {
                                        if (value == "") {
                                          return "Address Can't Be Empty";
                                        }
                                      },
                                      decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true),
                                      style: TextStyle(fontSize: fontSize),
                                      maxLines: 4,
                                      controller: controller.address),
                                ),
                                SizedBox(
                                  height: 2.h,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 1.h),
                width: 90.w,
                height: 8.h,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        elevation: 10,
                        primary: HexColor("363636")),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        controller.editProfileForm();
                      }
                    },
                    child: Text(
                      "Save Data",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 14.sp,
                          color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
