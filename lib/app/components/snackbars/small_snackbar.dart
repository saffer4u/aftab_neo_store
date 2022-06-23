import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';

SnackbarController smallSnackbar({
  int duration = 3,
  Color backgroundColor = WHITE_COLOR,
  double backgroundColorOpacity = 0.6,
  Color textColor = RED_COLOR800,
  required String text,
}) {
  return Get.showSnackbar(
    GetSnackBar(
      duration: Duration(seconds: duration),
      backgroundColor: backgroundColor.withOpacity(backgroundColorOpacity),
      messageText: Text(
        text,
        style: Theme.of(Get.context!).textTheme.headline3!.copyWith(
              color: textColor,
            ),
      ),
    ),
  );
}
