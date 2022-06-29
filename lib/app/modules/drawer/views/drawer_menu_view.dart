import '../../../common_controllers/auth_set_screen.dart';
import 'package:aftab_neo_store/app/components/enums.dart';
import 'package:aftab_neo_store/app/modules/drawer/views/drawer_menu_tile.dart';
import 'package:aftab_neo_store/app/constants/colors.dart';
import 'package:aftab_neo_store/app/modules/drawer/controllers/drawer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/widgets/drawer_user_info_tile.dart';

class DrawerMenuView extends GetView<MainDrawerController> {
  DrawerMenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Expanded(child: DrawerUserInfoTile()),
            Divider(
              thickness: 1.4,
              height: 0,
              color: BLACK_COLOR.withOpacity(
                0.4,
              ),
            ),
            Expanded(
              flex: 3,
              child: DrawerMenuTile(),
            ),
          ],
        ),
      ),
    );
  }
}
