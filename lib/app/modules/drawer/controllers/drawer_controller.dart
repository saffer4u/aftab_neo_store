import 'dart:developer';

import 'package:aftab_neo_store/app/common_controllers/auth_set_screen.dart';
import 'package:aftab_neo_store/app/common_controllers/global_controller.dart';
import 'package:aftab_neo_store/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';

import '../../../components/alert_boxes/simple_alert_dialog.dart';
import '../../../components/enums.dart';
import '../../../constants/colors.dart';
import '../models/menu_item_model.dart';

class MainDrawerController extends GetxController {
  //* Controllers
  final zoomDrawerController = ZoomDrawerController();

  //* List of drawer menu items
  final drawerMenuItems = [
    MenuItemModel(
      title: "My Cart",
      icon: Icons.card_travel,
      menuItem: MyMenuItem.myCart,
    ),
    MenuItemModel(
      title: "Tables",
      icon: Icons.table_bar,
      menuItem: MyMenuItem.tables,
    ),
    MenuItemModel(
      title: "Sofas",
      icon: Icons.chair,
      menuItem: MyMenuItem.sofas,
    ),
    MenuItemModel(
      title: "Chair",
      icon: Icons.chair_alt,
      menuItem: MyMenuItem.chair,
    ),
    MenuItemModel(
      title: "Cupboards",
      icon: Icons.coffee,
      menuItem: MyMenuItem.cups,
    ),
    MenuItemModel(
      title: "My Account",
      icon: Icons.person,
      menuItem: MyMenuItem.myAccount,
    ),
    MenuItemModel(
      title: "Store Locator",
      icon: Icons.where_to_vote,
      menuItem: MyMenuItem.storeLocator,
    ),
    MenuItemModel(
      title: "My Order",
      icon: Icons.checklist,
      menuItem: MyMenuItem.myOrder,
    ),
    MenuItemModel(
      title: "Log Out",
      icon: Icons.logout,
      menuItem: MyMenuItem.logout,
    ),
  ];

  //* Mehtods ------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  //* Toggle Drawer
  void toggleDrawer() {
    log("Toggle drawer called");
    zoomDrawerController.toggle?.call();
    update();
  }

  //* Navigation form drawer menu tile
  void onPressTileItem(MyMenuItem myMenuItem) {
    log(myMenuItem.toString());
    switch (myMenuItem) {
      case MyMenuItem.logout:
        logout();
        break;
      case MyMenuItem.tables:
        Get.toNamed(Routes.PRODUCT_LIST, arguments: getCategoryIndex("Table"));
        break;
      default:
    }
  }

  //* Get product category index by product title.
  int getCategoryIndex(String name) {
    int i;
    for (i = 0;
        i <
            Get.find<GlobalController>()
                .userData
                .data!
                .productCategories!
                .length;
        i++) {
      if (Get.find<GlobalController>()
              .userData
              .data!
              .productCategories![i]!
              .name ==
          name) {
        i = Get.find<GlobalController>()
            .userData
            .data!
            .productCategories![i]!
            .id!;
        break;
      }
    }
    return i;
  }

  void logout() {
    Get.dialog(
      SimpleAlertDialog(
        title: "Log Out",
        bodyText: "Are you sure?",
        popButtonText: "Cancel",
        okText: "Ok",
        onPressedOk: () {
          Get.find<AuthSetScreenController>().setToken(null);
        },
      ),
    );
  }
}
