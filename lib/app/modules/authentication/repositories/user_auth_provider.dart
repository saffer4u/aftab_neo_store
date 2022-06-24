import 'dart:developer';

import 'package:aftab_neo_store/app/modules/authentication/models/login_model.dart';

import '../models/api_response_model.dart';
import 'package:get/get_connect.dart';

import '../../../constants/paths.dart';
import '../models/register_model.dart';

class UserAuthProvider extends GetConnect {
  Future<ApiResponse> registerUser(RegisterModel userData) async {
    FormData formData = FormData(userData.toMap());

    try {
      final response = await post(
        REGISTER_NEW_USER_API_URL,
        formData,
      );
      log("Server Response : ${response.body.toString()}");
      ApiResponse res = apiResponseFromJson(response.body);
      return res;
    } catch (e) {
      log("Error while registring : $e");
      return ApiResponse(
        status: 500,
        message: "Something went wrong",
      );
    }
  }

  Future<ApiResponse> loginUser(LoginModel loginUserData) async {
    FormData formData = FormData(loginUserData.toMap());
    try {
      final response = await post(
        LOGIN_NEW_USER_API_URL,
        formData,
      );
      log("Server Response : ${response.body.toString()}");
      ApiResponse res = apiResponseFromJson(response.body);
      return res;
    } catch (e) {
      log("Error while login : $e");
      return ApiResponse(
        status: 501,
        message: "Something went wrong",
      );
    }
  }
}
