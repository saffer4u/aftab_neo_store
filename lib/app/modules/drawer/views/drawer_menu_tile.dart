import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_controllers/global_controller.dart';
import '../../../components/enums.dart';
import '../../../constants/colors.dart';
import '../controllers/drawer_controller.dart';

class DrawerMenuTile extends GetView<MainDrawerController> {
  const DrawerMenuTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: controller.drawerMenuItems.length,
      separatorBuilder: (_, index) {
        return Divider(
          height: 0,
          color: BLACK_COLOR.withOpacity(0.5),
        );
      },
      itemBuilder: (_, index) {
        return ListTile(
          hoverColor: RED_COLOR700.withOpacity(0.8),
          contentPadding: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          onTap: () => controller.onPressTileItem(
            controller.drawerMenuItems[index].menuItem,
          ),
          leading: Icon(
            controller.drawerMenuItems[index].icon,
            color: WHITE_COLOR,
          ),
          title: Text(
            controller.drawerMenuItems[index].title,
            style: Theme.of(context).textTheme.headline6,
          ),
          trailing: Builder(builder: (_) {
            //* Show no. of items in cart as red bubble
            if (controller.drawerMenuItems[index].menuItem ==
                    MyMenuItem.myCart &&
                Get.find<GlobalController>().userData.data!.totalCarts != 0) {
              return CircleAvatar(
                radius: 18,
                backgroundColor: RED_COLOR800,
                child: FittedBox(
                  child: Text(
                    Get.find<GlobalController>()
                        .userData
                        .data!
                        .totalCarts
                        .toString(),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              );
            }
           
            //* Show no. of items in my Orders as red bubble
            if (controller.drawerMenuItems[index].menuItem ==
                    MyMenuItem.myOrder &&
                Get.find<GlobalController>().userData.data!.totalOrders != 0) {
              return CircleAvatar(
                radius: 18,
                backgroundColor: RED_COLOR800,
                child: FittedBox(
                  child: Text(
                    Get.find<GlobalController>()
                        .userData
                        .data!
                        .totalOrders
                        .toString(),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              );
            }
            return SizedBox.shrink();
          }),
        );
      },
    );
  }
}
