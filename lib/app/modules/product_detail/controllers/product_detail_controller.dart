import 'package:aftab_neo_store/app/modules/product_detail/models/product_details_model.dart';
import 'package:aftab_neo_store/app/modules/product_detail/repositories/product_details_provider.dart';
import 'package:get/get.dart';

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

  void selectImage({required int index}) {
    imageIndex = index;
    update();
  }
}
