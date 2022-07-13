import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/progress_indicaters/on_loading.dart';
import '../../../components/widgets/appbar.dart';
import '../../../components/widgets/on_error.dart';
import '../../../constants/colors.dart';
import '../../../constants/fonts.dart';
import '../controllers/order_controller.dart';
import '../models/order_list_response_model.dart';

class OrderListView extends GetView<OrderController> {
  const OrderListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(text: "My Orders"),
      body: controller.obx(
        (state) {
          final orderList = state as OrderListResponseModel;
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: SizedBox(
                width: 600,
                child: ListView.separated(
                  itemCount: orderList.data!.length,
                  separatorBuilder: (_, index) => SizedBox(height: 10),
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: () => controller.getOrderDetails(
                          orderId: orderList.data![index].id!),
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: WHITE_COLOR,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(color: GREY_COLOR, blurRadius: 2),

                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Order ID : ${orderList.data![index].id}",
                                  style: Get.theme.textTheme.headline6!.copyWith(
                                    color: BLACK_COLOR,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  "Orderd Date : ${orderList.data![index].created}",
                                  style: TextStyle(
                                    fontFamily: Font.Gotham,
                                  ),
                                )
                              ],
                            ),
                            Text(
                              "₹ ${orderList.data![index].cost}",
                              style: Get.theme.textTheme.headline2!
                                  .copyWith(color: BLACK_COLOR, fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    );
                  },
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
          onRefresh: controller.getOrderedItems,
        ),
        onEmpty: Center(
          child: Text(
            "No order placed",
            style: Get.theme.textTheme.headline6!.copyWith(color: BLACK_COLOR),
          ),
        ),
      ),
    );
  }
}
