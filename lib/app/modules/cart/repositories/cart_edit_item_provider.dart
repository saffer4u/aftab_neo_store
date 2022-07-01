import 'dart:developer';

import 'package:get/get.dart';

import '../../../common_controllers/auth_set_screen.dart';
import '../../../constants/paths.dart';

class CartEditItemProvider extends GetConnect {
  Future<void> setCartItemQuantity({
    required int productId,
    required int quantity,
  }) async {
    FormData body = FormData({
      "product_id": productId,
      "quantity": quantity,
    });

    try {
      final response = await post(EDIT_CART_API_URL, body, headers: {
        "access_token": Get.find<AuthSetScreenController>().getToken!,
      });
      log(response.body);
    } catch (e) {
      log(e.toString());
    }
  }
}
