import 'dart:developer';

import 'package:get/get.dart';

import '../../../common_controllers/auth_set_screen.dart';
import '../../../constants/paths.dart';
import '../models/reset_password_response_model.dart';
import '../models/update_profile_response_model.dart';

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

  Future<UpdateProfileResponseModel> updateProfile(
      FormData updateProfileData) async {
    try {
      final response = await post(
        UPDATE_PROFILE_API_URL,
        updateProfileData,
        headers: {
          "access_token": Get.find<AuthSetScreenController>().getToken!,
        },
      );
      log(response.body.toString());
      return updateProfileResponseModelFromJson(response.body);
    } catch (e) {
      log("Error while updating user profile $e");

      return UpdateProfileResponseModel(
          status: 502, userMsg: "Something went wrong");
    }
  }
}
