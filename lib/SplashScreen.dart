import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kota_106/Login/LoginController.dart';

class SplashScreen extends GetView<LoginController> {
  Future<void> initializeSettings() async {
    controller.checkLoginStatus();

    await Future.delayed(Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return waitingView(context);
        } else {
          if (snapshot.hasError)
            return errorView(snapshot);
          else
            return controller.cekLogin();
        }
      },
    );
  }

  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(body: Center(child: Text('Error: ${snapshot.error}')));
  }

  Scaffold waitingView(BuildContext context) {
    var screenHeightSize = MediaQuery.of(context).size.height;
    var screenWidthSize = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: screenHeightSize,
        width: screenWidthSize,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/SplashScreen.png"),
                fit: BoxFit.cover)),
      ),
    );
  }
}
