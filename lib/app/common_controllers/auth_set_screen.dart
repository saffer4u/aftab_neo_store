import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routes/app_pages.dart';

class AuthSetScreenController extends GetxController {
  Rx<String?> _accessToken = Rx(null);
  @override
  void onInit() async {
    ever(_accessToken, _setInitialScreen);
    await _getTokenValFromPrfs();
    super.onInit();
  }

  void _setInitialScreen(Object? token) {
    if (token == null) {
      log("User logged out");
      Get.offAllNamed(Routes.AUTHENTICATION);
    } else {
      Get.offAllNamed(Routes.HOME);
      log("User logged in with access token : $token");
    }
  }

  //* Get access token value from preferences and assing it to the local variable
  Future<void> _getTokenValFromPrfs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _accessToken.value = prefs.getString("accessToken");
  }

  //* Get access token value
  String? get getToken => _accessToken.value;

  //* Set access token value when Login or Logout
  Future<void> setToken(String? token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (token == null) {
      prefs.remove("accessToken");
      _accessToken.value = null;
    } else {
      prefs.setString("accessToken", token);
      _accessToken.value = prefs.getString("accessToken");
    }
  }
}
