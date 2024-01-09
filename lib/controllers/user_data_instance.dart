import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserController extends GetxController {
  final box = GetStorage();

  RxString id = ''.obs;
  RxString username = ''.obs;
  RxString name = ''.obs;
  RxString policeStation = ''.obs;
  RxString designation = ''.obs;
  RxString district = ''.obs;
  RxString division = ''.obs;
  RxString circle = ''.obs;

  @override
  void onInit() {
    _loadFromLocal();
    super.onInit();
  }

  void setUserFromJson(Map<String, dynamic> json) {
    id.value = json['id'];
    username.value = json['username'];
    name.value = json['name'];
    policeStation.value = json['policeStation'];
    designation.value = json['designation'];
    district.value = json['district'];
    division.value = json['division'];
    circle.value = json['circle'];
    _saveToLocal();
  }

  void _loadFromLocal() {
    id.value = box.read('id') ?? '';
    username.value = box.read('username') ?? '';
    name.value = box.read('name') ?? '';
    policeStation.value = box.read('policeStation') ?? '';
    designation.value = box.read('designation') ?? '';
    district.value = box.read('district') ?? '';
    division.value = box.read('division') ?? '';
    circle.value = box.read('circle') ?? '';
  }

  void _saveToLocal() {
    box.write('id', id.value);
    box.write('username', username.value);
    box.write('name', name.value);
    box.write('policeStation', policeStation.value);
    box.write('designation', designation.value);
    box.write('district', district.value);
    box.write('division', division.value);
    box.write('circle', circle.value);
  }

  void printUserData() {
    if (kDebugMode) {
      print('User Data:');
      print('ID: ${id.value}');
      print('Username: ${username.value}');
      print('Name: ${name.value}');
      print('Police Station: ${policeStation.value}');
      print('Designation: ${designation.value}');
      print('District: ${district.value}');
      print('Division: ${division.value}');
      print('Circle: ${circle.value}');
    }
  }
}
