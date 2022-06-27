import '../../../components/enums.dart';
import 'package:flutter/widgets.dart';

class HomeGridItemModel {
  final IconData? icon;
  final String title;
  final Position titlePosition;
  final Position iconPosition;
  final double? edgeSpacing;

  HomeGridItemModel({
    this.icon,
    required this.title,
    required this.titlePosition,
    required this.iconPosition,
    this.edgeSpacing,
  });
}
