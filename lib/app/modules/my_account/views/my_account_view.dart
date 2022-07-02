import 'package:aftab_neo_store/app/common_controllers/global_controller.dart';
import 'package:aftab_neo_store/app/components/widgets/appbar.dart';
import 'package:aftab_neo_store/app/components/widgets/background_image.dart';
import 'package:aftab_neo_store/app/components/widgets/customButton.dart';
import 'package:aftab_neo_store/app/components/widgets/customTextField.dart';
import 'package:aftab_neo_store/app/modules/my_account/views/edit_profile_view.dart';
import 'package:aftab_neo_store/app/modules/my_account/views/reset_password_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/widgets/account_detail_field.dart';
import '../../../constants/colors.dart';
import '../controllers/my_account_controller.dart';

class MyAccountView extends GetView<MyAccountController> {
  final userData = Get.find<GlobalController>().userData.data!.userData;

  MyAccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(text: "My Account"),
      body: BackgroundImage(
        child: Column(
          children: [
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: BLACK_COLOR,
                    backgroundImage: NetworkImage(
                      userData!.profilePic ??
                          "https://picsum.photos/200/300/?blur=2",
                    ),
                    radius: 50,
                    child: Text(
                      "No Image",
                      style: Get.theme.textTheme.headline6!
                          .copyWith(color: BLACK_COLOR),
                    ),
                  ),
                  SizedBox(height: 20),
                  AccountDetailsField(
                      icon: Icons.account_circle,
                      text: controller.firstNameController.text),
                  AccountDetailsField(
                      icon: Icons.account_circle,
                      text: controller.lastNameController.text),
                  AccountDetailsField(
                      icon: Icons.email, text: controller.emailController.text),
                  AccountDetailsField(
                      icon: Icons.phone,
                      text: controller.phoneNoController.text),
                  AccountDetailsField(
                      icon: Icons.cake,
                      text: controller.dobControlller.text.isEmpty
                          ? "Unknown"
                          : controller.dobControlller.text),
                  SizedBox(height: 20),
                  CustomButton(
                    navigation: () => Get.to(() => EditProfileView()),
                    horizontalPadding: 0,
                    backgroundColor: WHITE_COLOR,
                    text: "EDIT PROFILE",
                    textColor: RED_COLOR700,
                  ),
                ],
              ),
            ),
            Spacer(),
            CustomButton(
              navigation: () => Get.to(() => ResetPasswordView()),
              horizontalPadding: 0,
              text: "RESET PASSWORD",
              textColor: BLACK_COLOR.withOpacity(0.5),
              backgroundColor: WHITE_COLOR,
            )
          ],
        ),
      ),
    );
  }
}
