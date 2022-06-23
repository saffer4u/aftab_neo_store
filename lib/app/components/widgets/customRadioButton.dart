import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/authentication/controllers/authentication_controller.dart';

class CustomRadioButton extends GetView<AuthenticationController> {
  final dynamic value;
  final dynamic groupValue;
  final void Function(dynamic)? onChanged;
  final String title;
  const CustomRadioButton({
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RadioListTile(
        activeColor: Theme.of(context).colorScheme.secondary,
        dense: true,
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
