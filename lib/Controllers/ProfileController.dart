import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kota_106/Controllers/CacheManager.dart';

class ProfileController extends GetxController with CacheManager {
  
  TextEditingController employeeId = TextEditingController();
  TextEditingController joinDate = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController noKTP = TextEditingController();
  TextEditingController npwp = TextEditingController();
  TextEditingController religion = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController status = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController position = TextEditingController();
}
