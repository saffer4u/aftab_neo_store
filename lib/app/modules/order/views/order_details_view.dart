import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../common_controllers/global_controller.dart';
import '../../../components/progress_indicaters/on_loading.dart';
import '../../../components/widgets/appbar.dart';
import '../../../components/widgets/on_error.dart';
import '../../../constants/colors.dart';
import '../../../constants/fonts.dart';
import '../controllers/order_controller.dart';

class OrderDetailsView extends GetView<OrderController> {
  const OrderDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) {
        return Scaffold(
          appBar: customAppBar(text: "Order ID : ${controller.myOrderId}"),
          body: ListView.separated(
            itemCount: controller.orderDetails.data!.orderDetails!.length + 1,
            separatorBuilder: (_, index) => Divider(height: 0,thickness: 1),
            itemBuilder: (_, index) {
              if (index == controller.orderDetails.data!.orderDetails!.length) {
                return Container(
                  color: WHITE_COLOR,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "TOTAL",
                        style: Get.theme.textTheme.headline1!.copyWith(
                          color: BLACK_COLOR,
                          fontSize: 20,
                        ),
                      ),
                      //  SizedBox(width: 150),
                      Text(
                        "₹ ${controller.orderDetails.data!.cost}",
                        style: Get.theme.textTheme.headline6!.copyWith(
                          color: BLACK_COLOR,
                          fontSize: 20,
                          fontFamily: Font.GothamBold,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Container(
                  color: WHITE_COLOR,
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        width: 160,
                        child: Image.network(
                          controller
                              .orderDetails.data!.orderDetails![index].prodImage
                              .toString(),
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
                              controller.orderDetails.data!.orderDetails![index]
                                  .prodName!,
                              style: Get.theme.textTheme.headline6!
                                  .copyWith(color: BLACK_COLOR, fontSize: 15),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "(${controller.orderDetails.data!.orderDetails![index].prodCatName})",
                              style: Get.theme.textTheme.headline3!
                                  .copyWith(color: GREY_COLOR),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  "QTY : ${controller.orderDetails.data!.orderDetails![index].quantity}",
                                  style:
                                      Get.theme.textTheme.headline6!.copyWith(
                                    color: BLACK_COLOR,
                                    fontFamily: Font.Gotham,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(width: 100),
                                Text(
                                  "₹ ${controller.orderDetails.data!.orderDetails![index].total}",
                                  style:
                                      Get.theme.textTheme.headline6!.copyWith(
                                    color: BLACK_COLOR,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
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
    );
  }
}
