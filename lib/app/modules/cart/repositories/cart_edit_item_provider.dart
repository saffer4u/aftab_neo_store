import 'dart:developer';

import 'package:get/get.dart';

import '../../../common_controllers/auth_set_screen.dart';
import '../../../constants/paths.dart';
import '../models/edit_cart_item_response_model.dart';

class CartEditItemProvider extends GetConnect {
  Future<EditCartItemResponseModel> setCartItemQuantity({
    required int productId,
    required int quantity,
  }) async {
    log(productId.toString());
    FormData body = FormData({
      "product_id": productId,
      "quantity": quantity,
    });

    try {
      final response = await post(EDIT_CART_API_URL, body, headers: {
        "access_token": Get.find<AuthSetScreenController>().getToken!,
      });
      log(response.body);
      return editCartItemResponseModelFromJson(response.body);
    } catch (e) {
      log(e.toString());
      return EditCartItemResponseModel(
          status: 502, userMsg: "Something went wrong");
    }
  }
}
