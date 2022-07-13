import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/progress_indicaters/on_loading.dart';
import '../../../components/widgets/appbar.dart';
import '../../../components/widgets/background_image.dart';
import '../../../components/widgets/customButton.dart';
import '../../../components/widgets/customTextField.dart';
import '../../../constants/colors.dart';
import '../controllers/my_account_controller.dart';

class ResetPasswordView extends GetView<MyAccountController> {
  const ResetPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(text: "Reset Password"),
      body: controller.obx(
        (state) {
          return BackgroundImage(
            child: Center(
              child: Container(
                width: 600,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Form(
                  key: controller.resetPasswordFormKey,
                  child: Column(
                    children: [
                      Text(
                        "NeoSTORE",
                        style: Get.theme.textTheme.headline1,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: WHITE_COLOR,
                        ),
                        controller: controller.oldPasswordController,
                        labelText: "Current Password",
                        validator: controller.validPassword,
                      ),
                      CustomTextField(
                        validator: controller.validNewPassword,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: WHITE_COLOR,
                        ),
                        controller: controller.passwordController,
                        labelText: "New Password",
                      ),
                      CustomTextField(
                        validator: controller.validNewPassword,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: WHITE_COLOR,
                        ),
                        controller: controller.confirmPasswordController,
                        labelText: "Confirm Password",
                      ),
                      SizedBox(height: 30),
                      CustomButton(
                        navigation: controller.resetPassword,
                        text: "RESET PASSWORD",
                        textColor: RED_COLOR700,
                        backgroundColor: WHITE_COLOR,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
          onLoading: OnLoading(
          loadingText: "Please wait...",
        ),
       
      ),
    );
  }
}
