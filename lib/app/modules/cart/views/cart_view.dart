import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../common_controllers/global_controller.dart';
import '../../../components/progress_indicaters/on_loading.dart';
import '../../../components/widgets/appbar.dart';
import '../../../components/widgets/on_error.dart';
import '../../../constants/colors.dart';
import '../controllers/cart_controller.dart';
import '../models/cart_item_response_model.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(text: "My Cart"),
      body: controller.obx(
        (state) {
          final data = state as CartItemResponseModel;
          return ListView.separated(
            itemCount: data.data!.length + 2,
            separatorBuilder: (_, index) => Divider(height: 0),
            itemBuilder: (_, index) {
              if (index == data.data!.length) {
                //* Total list tile
                return Container(
                  color: Colors.red,
                  height: 200,
                  width: 200,
                );
              } else if (index == data.data!.length + 1) {
                //* Order now button
                return Container(
                  height: 200,
                  color: Colors.black,
                );
              } else {
                return Slidable(
                  key: const ValueKey(0),

                  // The end action pane is the one at the right or the bottom side.
                  endActionPane: ActionPane(
                    extentRatio: 0.2,
                    motion: ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {},
                        backgroundColor: WHITE_COLOR,
                        foregroundColor: RED_COLOR700,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                    ],
                  ),

                  child: Container(
                    color: WHITE_COLOR,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          width: 160,
                          child: Image.network(
                            data.data![index].product!.productImages.toString(),
                            loadingBuilder:
                                Get.find<GlobalController>().loadingBuilder,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 20,
                            left: 20,
                            bottom: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.data![index].product!.name!,
                                style: Get.theme.textTheme.headline6!
                                    .copyWith(color: BLACK_COLOR),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "(${data.data![index].product!.productCategory!})",
                                style: Get.theme.textTheme.headline3!
                                    .copyWith(color: GREY_COLOR),
                              ),
                              DropdownButton<String>(
                                focusColor: RED_COLOR700,
                                value: data.data![index].quantity.toString(),

                                //elevation: 5,
                                style: TextStyle(color: GREY_COLOR,),
                                iconEnabledColor: BLACK_COLOR,
                                items: controller.quantityList
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  );
                                }).toList(),

                                onChanged: (newValue) =>
                                    controller.onSelectDropDownButton(
                                  selectedQuantity: newValue!,
                                  productId: data.data![index].id!,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          );
        },
        onLoading: OnLoading(
          loadingText: "Please wait...",
        ),
        onError: (_) => OnError(
          errText: "Something went wrong",
          onRefresh: controller.fetchCartProducts,
        ),
      ),
    );
  }
}
