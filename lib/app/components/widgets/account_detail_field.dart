import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';

class AccountDetailsField extends StatelessWidget {
  final String text;
  final IconData icon;
  const AccountDetailsField({
    required this.icon,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(border: Border.all(color: WHITE_COLOR)),
      child: Row(children: [
        Icon(
          icon,
          color: WHITE_COLOR,
        ),
        SizedBox(width: 10),
        Text(
          text,
          style: Get.theme.textTheme.headline6,
        )
      ]),
    );
  }
}
