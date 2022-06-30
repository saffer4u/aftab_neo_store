import 'package:aftab_neo_store/app/common_controllers/global_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_controllers/auth_set_screen.dart';
import '../../constants/colors.dart';

class DrawerUserInfoTile extends GetView<GlobalController> {
  // final userData = controller.userData;
  DrawerUserInfoTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          CircleAvatar(
            radius: 44,
            backgroundColor: WHITE_COLOR,
            child: CircleAvatar(
              backgroundColor: BLACK_COLOR,
              backgroundImage: NetworkImage(
                controller.userData.data!.userData!.profilePic ??
                    "https://picsum.photos/200/300/?blur=2",
              ),
              radius: 40,
              child: Visibility(
                visible:
                    controller.userData.data!.userData!.profilePic == null ? true : false,
                child: Text(
                  "${controller.userData.data!.userData!.firstName![0].toUpperCase()} ${controller.userData.data!.userData!.lastName![0].toUpperCase()}",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          FittedBox(
            child: Text(
              "${controller.userData.data!.userData!.firstName!.toUpperCase()} ${controller.userData.data!.userData!.lastName!.toUpperCase()}",
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          SizedBox(height: 5),
          FittedBox(
            child: Text(
              "${controller.userData.data!.userData!.email!.toLowerCase()} ",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ],
      ),
    );
  }
}
