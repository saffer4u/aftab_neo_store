import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';

import '../../../common_controllers/auth_set_screen.dart';
import '../../../common_controllers/global_controller.dart';
import '../../../components/dialog_boxes/simple_alert_dialog.dart';
import '../../../components/enums.dart';
import '../../../routes/app_pages.dart';
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
      title: "Beds",
      icon: Icons.coffee,
      menuItem: MyMenuItem.beds,
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
      case MyMenuItem.myCart:
        Get.toNamed(Routes.CART);
        break;
      case MyMenuItem.logout:
        logout();
        break;
      case MyMenuItem.tables:
        Get.toNamed(Routes.PRODUCT_LIST, arguments: getCategoryIndex("Table"));
        break;
      case MyMenuItem.sofas:
        Get.toNamed(Routes.PRODUCT_LIST, arguments: getCategoryIndex("Sofa"));
        break;
      case MyMenuItem.chair:
        Get.toNamed(Routes.PRODUCT_LIST, arguments: getCategoryIndex("Chairs"));
        break;
      case MyMenuItem.beds:
        Get.toNamed(Routes.PRODUCT_LIST, arguments: getCategoryIndex("Beds"));
        break;
      case MyMenuItem.myOrder:
        Get.toNamed(Routes.ORDER_LIST);
        break;
      default:
    }
  }

  //* Get product category index by product title.
  int getCategoryIndex(String name) {
    final productCategories =
        Get.find<GlobalController>().userData.data!.productCategories;
    int i;
    for (i = 0; i < productCategories!.length; i++) {
      if (productCategories[i]!.name == name) {
        i = productCategories[i]!.id!;
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
