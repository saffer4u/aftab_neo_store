import 'package:aftab_neo_store/app/modules/home/views/home_view_desktop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../home/views/home_view.dart';
import '../controllers/drawer_controller.dart';
import 'drawer_menu_view.dart';

class DrawerView extends GetView<MainDrawerController> {
  const DrawerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, cnstrn) {
      if (cnstrn.maxWidth < 800) {
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
      } else {
        return Row(
          children: [
            SizedBox(
              child: Material(child: DrawerMenuView(),color: Colors.transparent,),
              width: 300,
            ),
            Expanded(child: HomeViewDesktop()),
          ],
        );
      }
    });
  }
}
