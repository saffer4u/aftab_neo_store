import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/enums.dart';
import '../../../components/progress_indicaters/on_loading.dart';
import '../../../components/widgets/background_image.dart';
import '../../../components/widgets/customButton.dart';
import '../../../components/widgets/customTextField.dart';
import '../../../constants/colors.dart';
import '../controllers/authentication_controller.dart';

class LoginView extends GetView<AuthenticationController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: controller.obx(
        (state) => BackgroundImage(
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Form(
                      key: controller.loginFormKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "NeoSOFT",
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          CustomTextField(
                            validator: controller.validEmail,
                            controller: controller.emailController,
                            labelText: "Email",
                            prefixIcon: const Icon(
                              Icons.person,
                              color: WHITE_COLOR,
                            ),
                          ),
                          CustomTextField(
                            validator: controller.validpassword,
                            controller: controller.passwordController,
                            obscureText: true,
                            labelText: "Password",
                            prefixIcon: Icon(
                              Icons.lock,
                              color: WHITE_COLOR,
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          CustomButton(
                            text: "LOGIN",
                            backgroundColor: WHITE_COLOR,
                            textColor: RED_COLOR700,
                            navigation: controller.login,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () =>
                                controller.setScreen(AuthScreen.forgetPassword),
                            child: Text(
                              "FORGOT PASSWORD",
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          "DON'T HAVE AN ACCOUNT",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: GestureDetector(
                          onTap: () =>
                              controller.setScreen(AuthScreen.register),
                          child: Container(
                            color: RED_COLOR800,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        onLoading: OnLoading(
          loadingText: "Logging in, please wait...",
        ),
      ),
    );
  }
}
