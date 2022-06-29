import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/enums.dart';
import '../controllers/authentication_controller.dart';
import 'forget_password_view.dart';
import 'login_view.dart';
import 'register_view.dart';

class AuthenticationView extends GetView<AuthenticationController> {
  const AuthenticationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticationController>(
      builder: (_) {
        //* Renders different screens on the basis of AuthScreen value.
        switch (controller.authScreen) {
          case AuthScreen.login:
            return LoginView();
          case AuthScreen.register:
            return RegisterView();
          case AuthScreen.forgetPassword:
            return ForgetPasswordView();
          default:
            return LoginView();
        }
      },
    );
  }
}
