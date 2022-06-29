import 'package:flutter/widgets.dart';

import '../../../components/enums.dart';

class MenuItemModel {
  final String title;
  final IconData icon;
  final MyMenuItem menuItem;
  MenuItemModel({
    required this.title,
    required this.icon,
    required this.menuItem,
  });
}
