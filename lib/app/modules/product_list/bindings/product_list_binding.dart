import 'package:aftab_neo_store/app/modules/product_list/views/product_list_view.dart';
import 'package:get/get.dart';

import '../controllers/product_list_controller.dart';

class ProductListBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<ProductListController>(
    //   () => ProductListController(),
    // );

    Get.put<ProductListController>(ProductListController());
  }
}
