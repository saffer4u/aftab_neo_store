import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/progress_indicaters/on_loading.dart';
import '../../../components/widgets/appbar.dart';
import '../../../components/widgets/customButton.dart';
import '../../../components/widgets/custom_text_field2.dart';
import '../../../components/widgets/on_error.dart';
import '../../../constants/colors.dart';
import '../../cart/controllers/cart_controller.dart';
import '../controllers/order_controller.dart';

class OrderNoWView extends GetView<OrderController> {
  const OrderNoWView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(text: "Address"),
      body: controller.obx(
        (state) {
          return Center(
            child: SingleChildScrollView(
              child: Container(
                width: 600,
                padding: EdgeInsets.all(15),
                child: Form(
                  key: controller.addressFormKey,
                  child: Column(
                    children: [
                      CustomTextformField2(
                        validator: controller.validateAddress,
                        controller: controller.addressController,
                        maxLines: 3,
                        labelText: "ADDRESS*",
                      ),
                      SizedBox(height: 20),
                      CustomTextformField2(
                        controller: controller.cityLandmarkController,
                        maxLines: 1,
                        labelText: "CITY",
                        hintText: "LANDMARK",
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextformField2(
                              errorMaxLines: 2,
                              validator: controller.validateCity,
                              controller: controller.cityController,
                              labelText: "CITY*",
                            ),
                          ),
                          Expanded(
                            child: CustomTextformField2(
                              errorMaxLines: 2,
                              validator: controller.validateState,
                              controller: controller.stateController,
                              labelText: "STATE*",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextformField2(
                              errorMaxLines: 2,
                              validator: controller.validateZipCode,
                              controller: controller.zipCodeController,
                              labelText: "ZIP CODE*",
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          Expanded(
                            child: CustomTextformField2(
                              errorMaxLines: 2,
                              validator: controller.validateCountry,
                              controller: controller.countryController,
                              labelText: "COUNTRY*",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      SizedBox(
                        height: 60,
                        child: CustomButton(
                          navigation: controller.placeOrder,
                          backgroundColor: RED_COLOR700,
                          text: "PLACE ORDER",
                          textColor: WHITE_COLOR,
                          horizontalPadding: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        onLoading: OnLoading(
          loadingText: "Please wait...",
        ),
        onError: (_) => OnError(
          errText: "Something went wrong",
          onRefresh: () {
            Get.back();
            Get.find<CartController>().fetchCartProducts();
          },
        ),
      ),
    );
  }
}
