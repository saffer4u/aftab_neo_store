import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_controllers/global_controller.dart';
import '../../constants/colors.dart';
import '../../modules/product_detail/models/product_details_model.dart';
import '../widgets/customButton.dart';
import '../widgets/rating.dart';

class RatingDialog extends StatelessWidget {
  const RatingDialog({
    this.onRatingUpdate,
    this.onPressed,
    Key? key,
    required this.productDetails,
    required this.imageIndex,
  }) : super(key: key);

  final void Function(double)? onRatingUpdate;
  final void Function()? onPressed;
  final ProductDetailsModel productDetails;
  final int imageIndex;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        padding: EdgeInsets.all(20),
        width: Get.size.width,
        decoration: BoxDecoration(color: WHITE_COLOR),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              productDetails.data!.name!,
              style:
                  Get.theme.textTheme.headline6!.copyWith(color: BLACK_COLOR),
            ),
            SizedBox(height: 25),
            Image.network(
              productDetails.data!.productImages![imageIndex].image!,
              fit: BoxFit.contain,
              loadingBuilder: Get.find<GlobalController>().loadingBuilder,
            ),
            SizedBox(height: 40),
            Rating(
              iconSize: 35,
              rating: productDetails.data!.rating!.toDouble(),
              onRatingUpdate: onRatingUpdate == null
                  ? (rating) {
                      log(rating.toString());
                    }
                  : onRatingUpdate!,
            ),
            SizedBox(height: 25),
            CustomButton(
              navigation: onPressed,
              text: "RATE NOW",
              textColor: WHITE_COLOR,
              backgroundColor: RED_COLOR700,
            ),
          ],
        ),
      ),
    );
  }
}
