import 'dart:developer';

import 'package:get/get.dart';

import '../../../constants/paths.dart';
import '../models/product_list_model.dart';

class ProductListProvider extends GetConnect {
  Future<ProductsListModel> getProductList({
    required int productCategoryId,
    int limit = 10,
    int page = 1,
  }) async {
    final queryMap = {
      "product_category_id": productCategoryId.toString(),
      "limit": limit.toString(),
      "page": page.toString(),
    };

    try {
      final response = await get(GET_PRODUCT_LIST_API_URL, query: queryMap);
      log(response.body.toString());
      if (response.body == null) {
        return ProductsListModel(status: 502);
      } else {
        return productsListModelFromJson(response.body);
      }
      // return ProductsListModel(status: 200);
    } catch (e) {
      log("Error While fetching product list : $e");
      return ProductsListModel(status: 501);
    }
  }
}
