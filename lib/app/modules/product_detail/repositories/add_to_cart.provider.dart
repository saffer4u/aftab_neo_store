import 'dart:developer';

import 'package:get/get.dart';

import '../../../common_controllers/auth_set_screen.dart';
import '../../../constants/paths.dart';
import '../models/add_to_cart_model.dart';

class AddToCartProvider extends GetConnect {
  Future<AddToCartModel> addToCart({
    required final int productId,
    required final int quantity,
  }) async {
    FormData data = FormData({
      "product_id": productId,
      "quantity": quantity,
    });

    try {
      final response = await post(
        ADD_TO_CART_API_URL,
        data,
        headers: {
          "access_token": Get.find<AuthSetScreenController>().getToken!,
        },
      );
      log(response.body.toString());
      return addToCartModelFromJson(response.body);
    } catch (e) {
      return AddToCartModel(
        userMsg: "Something went wrong",
        status: 502,
        message: e.toString(),
      );
    }
  }
}
