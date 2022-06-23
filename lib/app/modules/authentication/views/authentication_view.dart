import 'package:aftab_neo_store/app/common_controllers/auth_set_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/authentication_controller.dart';

class AuthenticationView extends GetView<AuthenticationController> {
  const AuthenticationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.find<AuthSetScreenController>().setToken("23232322");
        },
        label: Text("Log In"),
      ),
      appBar: AppBar(
        title: const Text('AuthenticationView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AuthenticationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
