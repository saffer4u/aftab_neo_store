import 'dart:developer';

import 'package:aftab_neo_store/app/modules/drawer/models/menu_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';

class MainDrawerController extends GetxController {
  //* Controllers
  final zoomDrawerController = ZoomDrawerController();

  //* List of drawer menu items
  final drawerMenuItems = [
    MenuItemModel(title: "My Cart", icon: Icons.card_travel),
    MenuItemModel(title: "Tables", icon: Icons.table_bar),
    MenuItemModel(title: "Sofas", icon: Icons.chair),
    MenuItemModel(title: "Chair", icon: Icons.chair_alt),
    MenuItemModel(title: "Cups", icon: Icons.coffee),
    MenuItemModel(title: "My Account", icon: Icons.person),
    MenuItemModel(title: "Store Locator", icon: Icons.where_to_vote),
    MenuItemModel(title: "My Order", icon: Icons.checklist),
  ];

  //* Toggle Drawer
  void toggleDrawer() {
    log("Toggle drawer called");
    zoomDrawerController.toggle?.call();
    update();
  }
}
