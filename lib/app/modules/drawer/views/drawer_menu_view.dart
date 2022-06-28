import 'package:aftab_neo_store/app/modules/drawer/controllers/drawer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/widgets/drawer_user_info_tile.dart';

class DrawerMenuView extends GetView<MainDrawerController> {
  DrawerMenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          DrawerUserInfoTile(),
          // ListView.separated(

          //   itemCount: controller.drawerMenuItems.length,
          //   separatorBuilder: (_, index) {
          //     return Divider();
          //   },
          //   itemBuilder: (_, index) {
          //     return ListTile(
          //       title: Text(controller.drawerMenuItems[index].title),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
