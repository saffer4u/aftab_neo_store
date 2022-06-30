import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../modules/drawer/models/fetch_user_data_model.dart';

class GlobalController extends GetxController {

  FetchUserDataModel userData = FetchUserDataModel();
  //* Image loading builder
  Widget loadingBuilder(
      BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
    if (loadingProgress == null) return child;
    return Container(
      color: GREY_COLOR.withOpacity(0.5),
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: RED_COLOR700,
          color: BLACK_COLOR,
          value: loadingProgress.expectedTotalBytes != null
              ? loadingProgress.cumulativeBytesLoaded /
                  loadingProgress.expectedTotalBytes!
              : null,
        ),
      ),
    );
  }
}
