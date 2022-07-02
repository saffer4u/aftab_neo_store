import 'package:get/get.dart';

import '../../../components/snackbars/small_snackbar.dart';
import '../../../routes/app_pages.dart';
import '../models/product_list_model.dart';
import '../repositories/product_list_provider.dart';

class ProductListController extends GetxController with StateMixin<dynamic> {
  ProductsListModel productList = ProductsListModel();
  int categoryId = 0;

  @override
  void onInit() async {
    categoryId = Get.arguments as int;
    await fetchProductList();
    super.onInit();
  }

  //* Fetch list of products
  Future<void> fetchProductList({
    int limit = 10,
    int pageNumber = 1,
  }) async {
    change(null, status: RxStatus.loading());
    productList = await ProductListProvider().getProductList(
      productCategoryId: categoryId,
      limit: limit,
      page: pageNumber,
    );

    if (productList.status == 200) {
      change(productList, status: RxStatus.success());
    } else if (productList.status == 502) {
      change(null, status: RxStatus.error());
      smallSnackbar(
          text: "Server is not responding | Status ${productList.status}");
    } else {
      change(null, status: RxStatus.error());
      smallSnackbar(text: "Product fetch error | Status ${productList.status}");
    }
  }

  void onPressedProductTile(
      {required int productId, required int productIndex}) {
    Get.toNamed(Routes.PRODUCT_DETAIL, arguments: {
      "productId": productId,
      "productIndex": productIndex,
    });
  }
}
