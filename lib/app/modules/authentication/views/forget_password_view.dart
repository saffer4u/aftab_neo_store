import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/enums.dart';
import '../../../components/progress_indicaters/on_loading.dart';
import '../../../components/widgets/appbar.dart';
import '../../../components/widgets/background_image.dart';
import '../../../components/widgets/customButton.dart';
import '../../../components/widgets/customTextField.dart';
import '../../../constants/colors.dart';
import '../controllers/authentication_controller.dart';

class ForgetPasswordView extends GetView<AuthenticationController> {
  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        text: "Register",
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios_rounded),
              onPressed: () => controller.setScreen(AuthScreen.login),
            );
          },
        ),
      ),
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
                          Form(
                            key: controller.forgetPasswordFormKey,
                            child: CustomTextField(
                              controller: controller.emailController,
                              validator: controller.validEmail,
                              labelText: "Email",
                              prefixIcon: const Icon(
                                Icons.person,
                                color: WHITE_COLOR,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          CustomButton(
                            text: "SEND RECOVERY EMAIL",
                            backgroundColor: WHITE_COLOR,
                            textColor: RED_COLOR700,
                            navigation: controller.forgetPassword,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          GestureDetector(
                            onTap: () => controller.setScreen(AuthScreen.login),
                            child: Text(
                              "<<< BACK TO LOGIN",
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
         onLoading: OnLoading(
          loadingText: "Sending verification email, please wait...",
        ),
      ),
    );
  }
}
