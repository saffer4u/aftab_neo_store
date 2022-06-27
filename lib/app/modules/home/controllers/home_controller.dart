import '../../../components/enums.dart';
import '../models/home_grid_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var activeIndex = 0.obs;

  //* Carousel image urls
  final urlImages = [
    "https://images.unsplash.com/photo-1441986300917-64674bd600d8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    "https://images.unsplash.com/photo-1524758631624-e2822e304c36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    "https://images.unsplash.com/photo-1538688525198-9b88f6f53126?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80",
    "https://images.unsplash.com/photo-1616486338812-3dadae4b4ace?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1332&q=80",
  ];

  //* List of home grid items
  final List<HomeGridItemModel> homeGridItems = [
    HomeGridItemModel(
      icon: Icons.table_restaurant_outlined,
      title: "Tables",
      titlePosition: Position.topRight,
      iconPosition: Position.bottomLeft,
    ),
    HomeGridItemModel(
      icon: Icons.chair,
      title: "Sofas",
      titlePosition: Position.bottomLeft,
      iconPosition: Position.topRight,
    ),
    HomeGridItemModel(
      title: "Chairs",
      titlePosition: Position.topLeft,
      iconPosition: Position.bottomRight,
      icon: Icons.chair_alt,
    ),
    HomeGridItemModel(
      title: "CupBoards",
      titlePosition: Position.topLeft,
      iconPosition: Position.bottomRight,
      icon: Icons.directions_boat_rounded,
    ),
  ];
}
