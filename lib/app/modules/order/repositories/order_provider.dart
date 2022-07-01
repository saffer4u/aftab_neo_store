import 'dart:developer';

import 'package:get/get.dart';

import '../../../common_controllers/auth_set_screen.dart';
import '../../../constants/paths.dart';
import '../models/place_order_response_model.dart';

class OrderProvider extends GetConnect {
  Future<PlaceOrderResponseModel> placeOrder(
      {required final String address}) async {
    try {
      final response = await post(
        PLACE_ORDER_API_URL,
        FormData({"address": address}),
        headers: {
          "access_token": Get.find<AuthSetScreenController>().getToken!
        },
      );
      log(response.body.toString());
      return placeOrderResponseModelFromJson(response.body);
    } catch (e) {
      return PlaceOrderResponseModel(
          status: 502, userMsg: "Something went wrong");
    }
  }
}
