import 'dart:developer';

import '../../../constants/paths.dart';
import 'package:aftab_neo_store/app/modules/drawer/models/fetch_user_data_model.dart';
import 'package:get/get.dart';

import '../../../common_controllers/auth_set_screen.dart';

class UserDataProvider extends GetConnect {
  Future<FetchUserDataModel> getUserData() async {
    try {
      final response = await get(
        GET_USER_DATA_API_URL,
        headers: {
          "access_token": Get.find<AuthSetScreenController>().getToken!,
        },
      );
      FetchUserDataModel user = fetchUserDataModelFromJson(response.body);
      log("Fetch user data server response : ${response.body}");
      return user;
    } catch (e) {
      log("Error while fetching user data : $e");
      return FetchUserDataModel(
        status: 501,
        userMessage: "Something went wrong",
      );
    }
  }
}
