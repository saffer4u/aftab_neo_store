import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_controllers/global_controller.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../../modules/product_detail/controllers/product_detail_controller.dart';
import '../../modules/product_detail/models/product_details_model.dart';
import '../widgets/customButton.dart';

class BuyNowDialog extends GetView<ProductDetailController> {
  const BuyNowDialog({
    this.onPressed,
    Key? key,
    required this.productDetails,
    required this.imageIndex,
  }) : super(key: key);

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
            Text(
              "Enter Qty",
              style: Get.theme.textTheme.headline6!
                  .copyWith(color: BLACK_COLOR.withOpacity(0.5)),
            ),
            SizedBox(height: 25),
            SizedBox(
              width: 90,
              child: TextField(
                controller: controller.productQuantityController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  labelText: "Count",
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 30,
                  ),
                  border: const OutlineInputBorder(
                    // borderRadius: BorderRadius.circular(7.0),
                    borderSide: BorderSide(
                      color: RED_COLOR700,
                      width: 2,
                    ),
                  ),
                  isDense: true,

                  labelStyle: const TextStyle(
                    fontFamily: Font.Gotham,
                    color: GREY_COLOR,
                    fontSize: 14,
                  ),
                  fillColor: Colors.transparent,
                  focusedBorder: const OutlineInputBorder(
                    // borderRadius: BorderRadius.circular(7.0),
                    borderSide: BorderSide(
                      color: BLACK_COLOR,
                      width: 1.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    // borderRadius: BorderRadius.circular(7.0),
                    borderSide: BorderSide(
                      color: BLACK_COLOR.withOpacity(0.6),
                      width: 1.5,
                    ),
                  ),
                  errorStyle: TextStyle(color: WHITE_COLOR, fontSize: 10),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(255, 241, 241, 0.842),
                      width: 2,
                    ),
                  ),
                  // errorStyle: GoogleFonts.montserrat(
                  //     fontSize: 10, color: Colors.white.withOpacity(0.75)),
                ),
              ),
            ),
            SizedBox(height: 25),
            CustomButton(
              navigation: onPressed,
              text: "SUBMIT",
              textColor: WHITE_COLOR,
              backgroundColor: RED_COLOR700,
            ),
          ],
        ),
      ),
    );
  }
}
