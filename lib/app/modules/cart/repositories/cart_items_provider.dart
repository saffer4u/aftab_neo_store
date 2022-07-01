import 'dart:developer';

import 'package:get/get.dart';

import '../../../common_controllers/auth_set_screen.dart';
import '../../../constants/paths.dart';
import '../models/cart_item_response_model.dart';

class CartItemsProvider extends GetConnect {
  Future<CartItemResponseModel> getCartItems() async {
    try {
      final response = await get(LIST_CART_ITEMS_API_URL, headers: {
        "access_token": Get.find<AuthSetScreenController>().getToken.toString(),
      });
      log(response.body);
      return cartItemResponseModelFromJson(response.body);
    } catch (e) {
      return CartItemResponseModel(status: 502);
    }
  }
}
