import 'dart:developer';

import 'package:get/get.dart';

import '../../../constants/paths.dart';
import '../models/rating_model.dart';

class RatingProvider extends GetConnect {
  Future<RatingModel> rateProduct({
    required final double rating,
    required final String productId,
  }) async {
    FormData data = FormData({
      "product_id": productId,
      "rating": rating.toString(),
    });

    try {
      final response = await post(SET_RATING_API_URL, data);
      log(response.body.toString());
      return ratingModelFromJson(response.body);
    } catch (e) {
      return RatingModel(
        status: 502,
        userMsg: "Someting went wrong",
        message: e.toString(),
      );
    }
  }
}
