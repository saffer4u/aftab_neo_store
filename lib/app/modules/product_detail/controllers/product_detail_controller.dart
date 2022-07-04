import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../common_controllers/global_controller.dart';
import '../../../components/dialog_boxes/buy_now_dialog.dart';
import '../../../components/dialog_boxes/rating_dialog.dart';
import '../../../components/snackbars/small_snackbar.dart';
import '../../../constants/colors.dart';
import '../models/add_to_cart_model.dart';
import '../models/product_details_model.dart';
import '../repositories/add_to_cart.provider.dart';
import '../repositories/product_details_provider.dart';
import '../repositories/rating_prodvider.dart';

class ProductDetailController extends GetxController with StateMixin<dynamic> {
  ProductDetailsModel productDetails = ProductDetailsModel();
  TextEditingController productQuantityController =
      TextEditingController(text: "1");
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
  void buyNow() {
    Get.dialog(
      BuyNowDialog(
        productDetails: productDetails,
        imageIndex: imageIndex,
        onPressed: () async {
          if (productQuantityController.text.isEmpty ||
              int.parse(productQuantityController.text) < 1) {
            FocusManager.instance.primaryFocus?.unfocus();
            smallSnackbar(
              text: "Invalid Count",
              backgroundColor: WHITE_COLOR,
            );
          } else {
            Get.back();
            FocusManager.instance.primaryFocus?.unfocus();
            change(null, status: RxStatus.loading());

            // await Future.delayed(Duration(seconds: 5));

            AddToCartModel addToCartResponse =
                await AddToCartProvider().addToCart(
              productId: productDetails.data!.id!,
              quantity: int.parse(productQuantityController.text),
            );

            if (addToCartResponse.status == 200) {
              //* Fetch user data after adding to cart
              await Get.find<GlobalController>().fetchUserData();
              change(productDetails, status: RxStatus.success());

              smallSnackbar(
                  textColor: WHITE_COLOR,
                  backgroundColor: GREEN_COLOR,
                  backgroundColorOpacity: 1,
                  text:
                      "${(addToCartResponse.userMsg) ?? 'Added to cart successful'} | Total cart items : ${addToCartResponse.totalCarts}");
            } else {
              change(productDetails, status: RxStatus.success());

              smallSnackbar(
                text:
                    "${(addToCartResponse.userMsg) ?? "Something went wrong"} | Status : ${addToCartResponse.status}",
                backgroundColorOpacity: 1,
              );
            }
          }
        },
      ),
    );
  }

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
