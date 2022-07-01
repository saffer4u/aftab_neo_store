import 'package:get/get.dart';

import '../models/cart_item_response_model.dart';
import '../repositories/cart_edit_item_provider.dart';
import '../repositories/cart_items_provider.dart';

class CartController extends GetxController with StateMixin<dynamic> {
  CartItemResponseModel cartData = CartItemResponseModel();
  List<String> quantityList = ["1", "2", "3", "4", "5", "6", "7", "8"];
  @override
  void onInit() async {
    await fetchCartProducts();
    super.onInit();
  }

  Future<void> fetchCartProducts() async {
    change(null, status: RxStatus.loading());
    cartData = await CartItemsProvider().getCartItems();

    if (cartData.status == 200) {
      change(cartData, status: RxStatus.success());
    } else {
      change("Something went wrong", status: RxStatus.error());
    }
  }

  void onSelectDropDownButton({
    required String selectedQuantity,
    required int productId,
  }) async {
    await CartEditItemProvider().setCartItemQuantity(
      productId: productId,
      quantity: int.parse(selectedQuantity),
    );
  }
}
