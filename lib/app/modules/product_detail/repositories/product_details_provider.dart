import 'dart:developer';

import 'package:get/get.dart';

import '../../../constants/paths.dart';
import '../models/product_details_model.dart';

class ProductDetailsProvider extends GetConnect {
  Future<ProductDetailsModel> getProductDetails({
    required int productId,
  }) async {
    try {
      final response = await get(GET_PRODUCT_DETAILS_API_URL, query: {
        "product_id": productId.toString(),
      });
      log(response.body.toString());
      if (response.body == null) {
        return ProductDetailsModel(status: 502);
      } else {
        return productDetailsModelFromJson(response.body);
      }
    } catch (e) {
      log("Error While fetching product details : $e");
      return ProductDetailsModel(status: 501);
    }
  }
}
