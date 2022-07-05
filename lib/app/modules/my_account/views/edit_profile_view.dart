import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/progress_indicaters/on_loading.dart';
import '../../../components/widgets/appbar.dart';
import '../../../components/widgets/background_image.dart';
import '../../../components/widgets/customButton.dart';
import '../../../components/widgets/customTextField.dart';
import '../../../constants/colors.dart';
import '../controllers/my_account_controller.dart';

class EditProfileView extends GetView<MyAccountController> {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(text: "Edit Profile"),
      body: controller.obx(
        (state) {
          return BackgroundImage(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Form(
                  key: controller.editProfileFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => controller.picImage(context),
                        child: GetBuilder<MyAccountController>(
                          builder: (_) {
                            if (controller.pickedImage == null) {
                              return CircleAvatar(
                                radius: 50,
                                backgroundColor: WHITE_COLOR,
                                child: Icon(
                                  Icons.edit_outlined,
                                  size: 40,
                                  color: RED_COLOR700,
                                ),
                              );
                            } else {
                              return CircleAvatar(
                                radius: 50,
                                backgroundColor: WHITE_COLOR,
                                backgroundImage:
                                    FileImage(controller.pickedImage!),
                              );
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      CustomTextField(
                        validator: controller.validFirstName,
                        labelText: "First Name",
                        controller: controller.firstNameController,
                        prefixIcon: Icon(
                          Icons.account_circle,
                          color: WHITE_COLOR,
                        ),
                      ),
                      SizedBox(height: 10),
                      CustomTextField(
                        validator: controller.validLastName,
                        labelText: "Last Name",
                        controller: controller.lastNameController,
                        prefixIcon: Icon(
                          Icons.account_circle,
                          color: WHITE_COLOR,
                        ),
                      ),
                      SizedBox(height: 10),
                      CustomTextField(
                        validator: controller.validEmail,
                        labelText: "Email",
                        controller: controller.emailController,
                        prefixIcon: Icon(
                          Icons.mail,
                          color: WHITE_COLOR,
                        ),
                      ),
                      SizedBox(height: 10),
                      CustomTextField(
                        validator: controller.validPhoneNo,
                        labelText: "Phone Number",
                        controller: controller.phoneNoController,
                        prefixIcon: Icon(
                          Icons.phone,
                          color: WHITE_COLOR,
                        ),
                      ),
                      SizedBox(height: 10),
                      CustomTextField(
                        validator: controller.validDOB,
                        labelText: "DOB (dd-mm-yyyy)",
                        controller: controller.dobControlller,
                        prefixIcon: Icon(
                          Icons.cake,
                          color: WHITE_COLOR,
                        ),
                      ),
                      SizedBox(height: 20),
                      CustomButton(
                        navigation: controller.editProfileInfo,
                        text: "SUBMIT",
                        textColor: RED_COLOR700,
                        backgroundColor: WHITE_COLOR,
                        horizontalPadding: 0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        onLoading: OnLoading(
          loadingText: "Please wait...",
        ),
      ),
    );
  }
}
