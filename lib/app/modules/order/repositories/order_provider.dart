import 'dart:developer';

import 'package:get/get.dart';

import '../../../common_controllers/auth_set_screen.dart';
import '../../../constants/paths.dart';
import '../models/order_list_response_model.dart';
import '../models/place_order_response_model.dart';

class OrderProvider extends GetConnect {
  //* Place order API call ---->>>>>>>>>>
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

  //* Get order List API call ------->>>>>>>>>>

  Future<OrderListResponseModel> getOrderList() async {
    try {
      final response = await get(
        GET_ORDER_LIST_API_URL,
        headers: {
          "access_token": Get.find<AuthSetScreenController>().getToken!,
        },
      );
      log(response.body.toString());
      return orderListResponseModelFromJson(response.body);
    } catch (e) {
      log("Error while fetching Order List Products : $e");
      return OrderListResponseModel(
          status: 502, userMsg: "Something went wrong", message: "$e");
    }
  }
}
