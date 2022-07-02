import 'package:aftab_neo_store/app/components/widgets/appbar.dart';
import 'package:aftab_neo_store/app/components/widgets/background_image.dart';
import 'package:aftab_neo_store/app/components/widgets/customButton.dart';
import 'package:aftab_neo_store/app/components/widgets/customTextField.dart';
import 'package:aftab_neo_store/app/components/widgets/on_error.dart';
import 'package:aftab_neo_store/app/constants/colors.dart';
import 'package:aftab_neo_store/app/modules/my_account/controllers/my_account_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/progress_indicaters/on_loading.dart';

class ResetPasswordView extends GetView<MyAccountController> {
  const ResetPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(text: "Reset Password"),
      body: controller.obx(
        (state) {
          return BackgroundImage(
            child: Container(
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
          );
        },
          onLoading: OnLoading(
          loadingText: "Please wait...",
        ),
       
      ),
    );
  }
}
