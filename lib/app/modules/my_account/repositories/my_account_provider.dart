import 'dart:developer';

import 'package:aftab_neo_store/app/common_controllers/auth_set_screen.dart';
import 'package:aftab_neo_store/app/constants/paths.dart';
import 'package:aftab_neo_store/app/modules/my_account/models/reset_password_response_model.dart';
import 'package:get/get.dart';

class MyAccountProvider extends GetConnect {
  Future<ResetPasswordResponseModel> resetPassword(FormData data) async {
    try {
      final response = await post(CHANGE_PASSWORD_API_URL, data, headers: {
        "access_token": Get.find<AuthSetScreenController>().getToken!
      });
      log(response.body.toString());
      return resetPasswordResponseModelFromJson(response.body);
    } catch (e) {
      return ResetPasswordResponseModel(
          status: 502, userMsg: "Something went wrong");
    }
  }
}
