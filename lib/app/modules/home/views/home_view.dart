import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_controllers/auth_set_screen.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: ()async {
          await Get.find<AuthSetScreenController>().setToken(null);
        },

        label: Text("Log out"),
      ),
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
