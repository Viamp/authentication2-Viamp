import 'package:f_authentication_template/domain/controllers/authentication_controller.dart';
import 'package:f_authentication_template/domain/use_case/authentication.dart';
import 'package:flutter/material.dart';
//import 'package: f_authentication_template/domain/use_case/authentication.dart';
import 'package:get/get.dart';

import 'ui/my_app.dart';

void main() {
  Get.lazyPut<Authentication>(() => Authentication());
  Get.lazyPut<AuthenticationController>(() => AuthenticationController());
  runApp(MyApp());
}
