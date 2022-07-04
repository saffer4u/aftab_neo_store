import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_controllers/global_controller.dart';
import '../../../components/widgets/account_detail_field.dart';
import '../../../components/widgets/appbar.dart';
import '../../../components/widgets/background_image.dart';
import '../../../components/widgets/customButton.dart';
import '../../../constants/colors.dart';
import '../controllers/my_account_controller.dart';
import 'edit_profile_view.dart';
import 'reset_password_view.dart';

class MyAccountView extends GetView<MyAccountController> {
  MyAccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(text: "My Account"),
      body: BackgroundImage(
        child: Column(
          children: [
            Spacer(),
            GetBuilder<GlobalController>(
              builder: (globalController) {
                final userData = globalController.userData.data!.userData;
                return Container(
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
                        child: userData.profilePic == null
                            ? Text(
                                "No Image",
                                style: Get.theme.textTheme.headline6!
                                    .copyWith(color: BLACK_COLOR),
                              )
                            : SizedBox.shrink(),
                      ),
                      SizedBox(height: 20),
                      AccountDetailsField(
                          icon: Icons.account_circle,
                          text: controller.firstNameController.text),
                      AccountDetailsField(
                          icon: Icons.account_circle,
                          text: controller.lastNameController.text),
                      AccountDetailsField(
                          icon: Icons.email,
                          text: controller.emailController.text),
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
                );
              },
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
