import 'dart:developer';

import 'package:get/get.dart';

import '../../../common_controllers/auth_set_screen.dart';
import '../../../constants/paths.dart';
import '../models/delete_cart_item_response_model.dart';

class CartDeleteItemProvider extends GetConnect {
  Future<DeleteCartItemResponseModel> deteCartItem(
      {required final int productId}) async {
    FormData body = FormData({"product_id": productId.toString()});
    try {
      final response = await post(DELETE_CART_ITEM_API_URL, body, headers: {
        "access_token": Get.find<AuthSetScreenController>().getToken!,
      });

      log(response.body.toString());
      return deleteCartItemResponseModelFromJson(response.body);
    } catch (e) {
      return DeleteCartItemResponseModel(
          status: 502, userMsg: "Something went wrong");
    }
  }
}
