import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'LoginController.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/Login_Page.jpg"),
                fit: BoxFit.cover)),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 140)),
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/Logo_Garuda.jpg"),
                  radius: 50,
                ),
                // Image.asset("assets/images/Logo_garuda.jpg"),
                Padding(padding: EdgeInsets.only(top: 25)),
                Text(
                  "LOGIN KARYAWAN",
                  style: TextStyle(fontFamily: "Roboto", fontSize: 18),
                ),
                Form(
                  key: controller.formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(top: 30)),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 350,
                        child: Text(
                          "Email",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 16,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Container(
                        width: 350,
                        child: TextFormField(
                          controller: controller.email,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              hintText: "Masukan Email Anda....",
                              fillColor: HexColor("E5E5E5"),
                              filled: true),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            bool isvalid =
                                EmailValidator.validate(value.toString());
                            if (!isvalid) {
                              return "Masukan Email Yang Valid";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 25,),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 350,
                        child: Text(
                          "Password",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 16,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Obx(() {
                        return Container(
                          width: 350,
                          child: TextFormField(
                            controller: controller.password,
                            obscureText: controller.isObsecure.value,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                suffixIcon: IconButton(
                                  icon: Icon(controller.isObsecure.value
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    if (controller.isObsecure.value == true) {
                                      controller.unSecurePassword();
                                    } else {
                                      controller.securePassword();
                                    }
                                    print(controller.isObsecure.value);
                                  },
                                ),
                                hintText: "Masukan Password Anda....",
                                fillColor: HexColor("E5E5E5"),
                                filled: true),
                            // ignore: body_might_complete_normally_nullable
                            validator: (value) {
                              if (value == "") {
                                return "Password tidak boleh kosong";
                              } else if (value!.length < 8) {
                                return "Password minimal 8 karakter";
                              }
                            },
                          ),
                        );
                      }),
                      SizedBox(
                        height: 30,
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
                              if (controller.formkey.currentState!.validate()) {
                                controller.login(controller.email.text,
                                    controller.password.text);
                              }
                            },
                            child: Text(
                              "SIGN IN",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 16,
                                  color: Colors.white),
                            )),
                      ),
                      Padding(padding: EdgeInsets.only(top: 15)),
                      Container(
                        width: 350,
                        height: 40,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                elevation: 10,
                                side: BorderSide(color: Colors.black),
                                primary: Colors.white),
                            onPressed: () {},
                            child: Text(
                              "FORGOT PASSWORD",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 16,
                                  color: Colors.black),
                            )),
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 15))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
