import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/dialog_boxes/simple_alert_dialog.dart';
import '../../../components/snackbars/small_snackbar.dart';
import '../../../constants/colors.dart';
import '../../cart/controllers/cart_controller.dart';
import '../repositories/order_provider.dart';

class OrderController extends GetxController with StateMixin<dynamic> {
  final addressFormKey = GlobalKey<FormState>();

  //* Text editing controllers ---->>>>>>>>>>>>>
  TextEditingController addressController = TextEditingController();
  TextEditingController cityLandmarkController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  //* Text Field validations --------->>>>>>>>>>

  String? validateAddress(String? value) {
    if (value!.isEmpty || value.length < 5) {
      return "Address Length can't be less then 5 letters";
    } else
      return null;
  }

  String? validateCity(String? value) {
    if (value!.isEmpty || value.length < 3) {
      return "City Length can't be less then 3 letters";
    } else
      return null;
  }

  String? validateState(String? value) {
    if (value!.isEmpty || value.length < 2) {
      return "State Length can't be less then 2 letters";
    } else
      return null;
  }

  String? validateZipCode(String? value) {
    if (value!.isEmpty || value.length < 5) {
      return "Zip Code Length can't be less then 5 numbers";
    } else
      return null;
  }

  String? validateCountry(String? value) {
    if (value!.isEmpty || value.length < 4) {
      return "Country Length can't be less then 4 letters";
    } else
      return null;
  }

  //* Other methods ----------->>>>>>>>>>>>>>>>
  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }

  void placeOrder() {
    if (addressFormKey.currentState!.validate()) {
      Get.dialog(
        SimpleAlertDialog(
          title: "Place Order",
          bodyText: "Are you sure?",
          okText: "Ok",
          popButtonText: "Cancel",
          onPressedOk: () async {
            Get.back();
            Get.back();
            final addressString =
                "${addressController.text}, ${cityLandmarkController.text}, ${cityController.text}, ${stateController.text}, ${zipCodeController.text}, ${countryController.text}.";

            final orderResponse =
                await OrderProvider().placeOrder(address: addressString);

            if (orderResponse.status == 200) {
              smallSnackbar(
                text: orderResponse.userMsg!,
                textColor: WHITE_COLOR,
                backgroundColor: GREEN_COLOR,
                backgroundColorOpacity: 1,
              );
            } else {
              smallSnackbar(
                text:
                    "${orderResponse.userMsg!} | Status : ${orderResponse.status}",
              );
            }

            // change(null, status: RxStatus.success());
            // Get.back();
            Get.find<CartController>().fetchCartProducts();
          },
        ),
      );
    }
  }
}
