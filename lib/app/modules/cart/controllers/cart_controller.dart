import 'package:get/get.dart';

import '../../../components/snackbars/small_snackbar.dart';
import '../../../constants/colors.dart';
import '../../../routes/app_pages.dart';
import '../models/cart_item_response_model.dart';
import '../models/edit_cart_item_response_model.dart';
import '../repositories/cart_delete_item_provider.dart';
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

  //* Fetch cart products
  Future<void> fetchCartProducts() async {
    change(null, status: RxStatus.loading());
    cartData = await CartItemsProvider().getCartItems();

    if (cartData.status == 200) {
      if (cartData.data == null) {
        change(null, status: RxStatus.empty());
      } else {
        change(cartData, status: RxStatus.success());
      }
    } else {
      change("Something went wrong", status: RxStatus.error());
    }
  }

//* Change product quantity
  void onSelectDropDownButton({
    required String selectedQuantity,
    required int productId,
  }) async {
    change(null, status: RxStatus.loading());
    EditCartItemResponseModel editCartResponse =
        await CartEditItemProvider().setCartItemQuantity(
      productId: productId,
      quantity: int.parse(selectedQuantity),
    );

    await fetchCartProducts();
    if (editCartResponse.status == 200) {
      smallSnackbar(
        text: editCartResponse.userMsg!,
        textColor: WHITE_COLOR,
        backgroundColor: GREEN_COLOR,
        backgroundColorOpacity: 1,
      );
    } else {
      smallSnackbar(
        text:
            "${editCartResponse.userMsg!} | Status : ${editCartResponse.status}",
      );
    }
  }

  //* Order Now button press handler
  void orderNow() {
    Get.toNamed(Routes.ORDER_NOW);
  }

  //* Delete item handler
  void deleteItem({required int productId}) async {
    // log(productId.toString());
    change(null, status: RxStatus.loading());
    final cartDeleteItemResponse =
        await CartDeleteItemProvider().deteCartItem(productId: productId);
    await fetchCartProducts();
    if (cartDeleteItemResponse.status == 200) {
      smallSnackbar(
        text: cartDeleteItemResponse.userMsg!,
        textColor: WHITE_COLOR,
        backgroundColor: GREEN_COLOR,
        backgroundColorOpacity: 1,
      );
    } else {
      smallSnackbar(
        text:
            "${cartDeleteItemResponse.userMsg!} | Status : ${cartDeleteItemResponse.status}",
      );
    }
  }
}
