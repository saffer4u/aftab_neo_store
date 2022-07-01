import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/widgets/appbar.dart';
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
            child: Text(
              'OrderView is working',
              style: TextStyle(fontSize: 20),
            ),
          );
        },
      ),
    );
  }
}
