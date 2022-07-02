import 'dart:developer';

import 'package:aftab_neo_store/app/common_controllers/global_controller.dart';
import 'package:aftab_neo_store/app/modules/my_account/models/reset_password_response_model.dart';
import 'package:aftab_neo_store/app/modules/my_account/repositories/my_account_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../components/snackbars/small_snackbar.dart';
import '../../../constants/colors.dart';

class MyAccountController extends GetxController with StateMixin<dynamic> {
  final resetPasswordFormKey = GlobalKey<FormState>();
  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }

  //* Text fields controllers
  TextEditingController firstNameController = TextEditingController(
    text: Get.find<GlobalController>().userData.data!.userData!.firstName,
  );
  TextEditingController lastNameController = TextEditingController(
    text: Get.find<GlobalController>().userData.data!.userData!.lastName,
  );
  TextEditingController emailController = TextEditingController(
    text: Get.find<GlobalController>().userData.data!.userData!.email,
  );

  TextEditingController phoneNoController = TextEditingController(
    text: Get.find<GlobalController>().userData.data!.userData!.phoneNo,
  );
  TextEditingController dobControlller = TextEditingController(
    text: Get.find<GlobalController>().userData.data!.userData!.dob,
  );
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  //* Validation methods
  String? validPassword(String? cpass) {
    if (oldPasswordController.text.isEmpty ||
        oldPasswordController.text.length < 6) {
      return "Password length can't be less then 6";
    } else {
      return null;
    }
  }

  String? validNewPassword(String? cpass) {
    if (passwordController.text != confirmPasswordController.text ||
        passwordController.text.isEmpty) {
      return "Password does not match";
    } else if (passwordController.text.length < 6) {
      return "Password length can't be less then 6";
    } else {
      return null;
    }
  }

  //* Other methods ----->>>>>>>>>>
  Future<void> resetPassword() async {
    if (resetPasswordFormKey.currentState!.validate()) {
      change(null, status: RxStatus.loading());
      ResetPasswordResponseModel resetPasswordResponse =
          await MyAccountProvider().resetPassword(FormData({
        "old_password": oldPasswordController.text,
        "password": passwordController.text,
        "confirm_password": confirmPasswordController.text,
      }));
      change(null, status: RxStatus.success());

      if (resetPasswordResponse.status == 200) {
        Get.back();
        smallSnackbar(
          text: resetPasswordResponse.userMsg!,
          textColor: WHITE_COLOR,
          backgroundColor: GREEN_COLOR,
          backgroundColorOpacity: 1,
        );
      } else {
        smallSnackbar(
          text:
              "${resetPasswordResponse.userMsg!} | Status : ${resetPasswordResponse.status}",
        );
      }
    }
  }
}
