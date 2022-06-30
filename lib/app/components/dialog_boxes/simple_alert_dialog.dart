import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';

class SimpleAlertDialog extends StatelessWidget {
  final String title;
  final String? bodyText;
  final Color? buttonSplashColor;
  final String? okText;
  final Color? okButtonColor;
  final String? popButtonText;
  final void Function()? onPressedOk;
  const SimpleAlertDialog({
    this.onPressedOk,
    this.okButtonColor,
    this.popButtonText,
    this.okText,
    this.buttonSplashColor,
    required this.title,
    this.bodyText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: BLACK_COLOR.withOpacity(0.8),
      title: Text(title),
      content: bodyText == null
          ? null
          : Text(
              bodyText!,
              style: Get.theme.textTheme.headline5,
            ),
      actions: [
        okText != null
            ? TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateColor.resolveWith(
                    (states) {
                      if (buttonSplashColor == null) {
                        return RED_COLOR700.withOpacity(0.2);
                      } else {
                        return buttonSplashColor!;
                      }
                    },
                  ),
                ),
                onPressed: onPressedOk,
                child: Text(okText!,
                    style: Get.theme.textTheme.headline4!
                        .copyWith(color: okButtonColor ?? RED_COLOR700)),
              )
            : SizedBox.shrink(),
        popButtonText != null
            ? TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateColor.resolveWith(
                    (states) {
                      if (buttonSplashColor == null) {
                        return RED_COLOR700.withOpacity(0.2);
                      } else {
                        return buttonSplashColor!;
                      }
                    },
                  ),
                ),
                onPressed: Get.back,
                child:
                    Text(popButtonText!, style: Get.theme.textTheme.headline4))
            : SizedBox.shrink(),
      ],
    );
  }
}
