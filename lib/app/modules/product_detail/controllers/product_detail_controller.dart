import 'dart:developer';

import '../../../components/widgets/customButton.dart';
import '../../../components/widgets/rating.dart';
import '../../../constants/colors.dart';
import '../models/product_details_model.dart';
import '../repositories/product_details_provider.dart';
import '../repositories/rating_prodvider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_controllers/global_controller.dart';
import '../../../components/dialog_boxes/rating_dialog.dart';
import '../../../components/snackbars/small_snackbar.dart';

class ProductDetailController extends GetxController with StateMixin<dynamic> {
  ProductDetailsModel productDetails = ProductDetailsModel();
  int imageIndex = 0;
  int productId = 1;
  int productIndex = 0;
  @override
  void onInit() async {
    final sentData = Get.arguments as Map<String, int>;
    productId = sentData["productId"]!;
    productIndex = sentData["productIndex"]!;
    await fetchProductDetails();
    super.onInit();
  }

  //* Fetch detail of product
  Future<void> fetchProductDetails() async {
    change(null, status: RxStatus.loading());
    productDetails =
        await ProductDetailsProvider().getProductDetails(productId: productId);

    if (productDetails.status == 200) {
      change(productDetails, status: RxStatus.success());
    } else if (productDetails.status == 502) {
      change(null, status: RxStatus.error());
      smallSnackbar(
          text: "Server is not responding | Status ${productDetails.status}");
    } else {
      change(null, status: RxStatus.error());
      smallSnackbar(
          text: "Product fetch error | Status ${productDetails.status}");
    }
  }

  //* on buy now button press
  void buyNow() {}

  //* On rating button pressed
  void rating() {
    double rating = productDetails.data!.rating!.toDouble();
    Get.dialog(
      RatingDialog(
        productDetails: productDetails,
        imageIndex: imageIndex,
        onRatingUpdate: (newRating) {
          rating = newRating;
        },
        onPressed: () async {
          // log("Raging : $rating");
          Get.back();
          change(null, status: RxStatus.loading());
          final ratingResponse = await RatingProvider().rateProduct(
            rating: rating,
            productId: productDetails.data!.id.toString(),
          );
          if (ratingResponse.status == 200) {
            smallSnackbar(
                textColor: WHITE_COLOR,
                backgroundColor: GREEN_COLOR,
                backgroundColorOpacity: 1,
                text:
                    "${(ratingResponse.userMsg) ?? 'Product rating successful'}");
          } else {
            smallSnackbar(
              text:
                  "${(ratingResponse.userMsg) ?? "Something went wrong"} | Status : ${ratingResponse.status}",
              backgroundColorOpacity: 1,
            );
          }

          change(productDetails, status: RxStatus.success());
        },
      ),
    );
  }

  void selectImage({required int index}) {
    imageIndex = index;
    update();
  }
}
