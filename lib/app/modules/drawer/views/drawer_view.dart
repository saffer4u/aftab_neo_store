import '../../../constants/colors.dart';
import '../controllers/drawer_controller.dart';
import 'drawer_menu_view.dart';
import '../../home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'package:get/get.dart';

class DrawerView extends GetView<MainDrawerController> {
  const DrawerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainDrawerController>(
      builder: (_) => ZoomDrawer(
        controller: _.zoomDrawerController,
        menuScreen: DrawerMenuView(),
        mainScreen: HomeView(),
        // showShadow: true,
        angle: 0,
        menuScreenWidth: 275,
        borderRadius: 5,
        slideWidth: 275,
        isRtl: false,
        mainScreenTapClose: true,
        drawerShadowsBackgroundColor: WHITE_COLOR,
        menuBackgroundColor: WHITE_COLOR.withOpacity(0.12),
        style: DrawerStyle.defaultStyle,
        // slideWidth: MediaQuery.of(context).size.width * 0.65,
      ),
    );
  }
}
