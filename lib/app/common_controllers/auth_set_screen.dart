import 'dart:developer';

import 'package:aftab_neo_store/app/components/snackbars/small_snackbar.dart';
import 'package:aftab_neo_store/app/constants/colors.dart';
import 'package:aftab_neo_store/app/constants/paths.dart';
import 'package:aftab_neo_store/app/modules/drawer/models/fetch_user_data_model.dart';
import 'package:aftab_neo_store/app/modules/drawer/repositories/user_data_provider.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routes/app_pages.dart';

class AuthSetScreenController extends GetxController {
  FetchUserDataModel userData = FetchUserDataModel();
  Rx<String?> _accessToken = Rx(null);
  @override
  void onInit() async {
    ever(_accessToken, _setInitialScreen);
    await _getTokenValFromPrfs();
    super.onInit();
  }

  void _setInitialScreen(Object? token) async {
    if (token == null) {
      log("User logged out");
      Get.offAllNamed(Routes.AUTHENTICATION);
    } else {
      userData = await UserDataProvider().getUserData();

      if (userData.status == 200) {
        Get.offAllNamed(Routes.DRAWER);
      } else {
        //TODO : Implement user data fetch error page
        smallSnackbar(
          text: "User Data fetch error please restart the application",
          textColor: WHITE_COLOR,
          backgroundColor: RED_COLOR700,
        );
      }

      log("User logged in with access token : $token");
    }
  }

  //* Get access token value from preferences and assing it to the local variable
  Future<void> _getTokenValFromPrfs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _accessToken.value = prefs.getString(ACCESS_TOKEN);
  }

  //* Get access token value
  String? get getToken => _accessToken.value;

  //* Set access token value when Login or Logout
  Future<void> setToken(String? token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (token == null) {
      prefs.remove(ACCESS_TOKEN);
      _accessToken.value = null;
    } else {
      prefs.setString(ACCESS_TOKEN, token);
      _accessToken.value = prefs.getString(ACCESS_TOKEN);
    }
  }
}
