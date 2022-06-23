import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/authentication_controller.dart';
import 'register_view.dart';

class AuthenticationView extends GetView<AuthenticationController> {
  const AuthenticationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RegisterView();
  }
}
