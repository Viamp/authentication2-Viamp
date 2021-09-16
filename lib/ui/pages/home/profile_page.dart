import 'package:f_authentication_template/domain/controllers/authentication_controller.dart';
import 'package:f_authentication_template/ui/pages/authentication/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationController _authentication = Get.find();
    return Container(
      child: Center(
          child: ElevatedButton(
        key: Key('profileLogout'),
        child: Text('Logout'),
        onPressed: () {
          _authentication.logout();
          //Get.to(LoginPage());
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        },
      )),
    );
  }
}
