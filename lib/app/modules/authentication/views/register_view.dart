import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/enums.dart';
import '../../../components/progress_indicaters/on_loading.dart';
import '../../../components/widgets/appbar.dart';
import '../../../components/widgets/background_image.dart';
import '../../../components/widgets/customButton.dart';
import '../../../components/widgets/customRadioButton.dart';
import '../../../components/widgets/customTextField.dart';
import '../../../constants/colors.dart';
import '../controllers/authentication_controller.dart';

class RegisterView extends GetView<AuthenticationController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        text: "Register",
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios_rounded),
              onPressed: () => controller.setScreen(AuthScreen.login),
            );
          },
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          controller.setScreen(AuthScreen.login);
          return true;
        },
        child: controller.obx(
          (state) => BackgroundImage(
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: controller.registrationFormKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 30,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("NeoSTORE",
                            style: Theme.of(context).textTheme.headline1),
                        SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          labelText: "First Name",
                          controller: controller.firstNameController,
                          validator: controller.validFirstName,
                          prefixIcon: Icon(
                            Icons.person,
                            color: WHITE_COLOR,
                          ),
                        ),
                        CustomTextField(
                          labelText: "Last Name",
                          controller: controller.lastNameController,
                          validator: controller.validLastName,
                          prefixIcon: Icon(
                            Icons.person,
                            color: WHITE_COLOR,
                          ),
                        ),
                        CustomTextField(
                          labelText: "Email",
                          controller: controller.emailController,
                          validator: controller.validEmail,
                          prefixIcon: Icon(
                            Icons.mail,
                            color: WHITE_COLOR,
                          ),
                        ),
                        CustomTextField(
                          labelText: "Password",
                          controller: controller.passwordController,
                          validator: controller.validpassword,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: WHITE_COLOR,
                          ),
                        ),
                        CustomTextField(
                          labelText: "Confirm Password",
                          controller: controller.confirmPasswordController,
                          validator: controller.validConfirmPassword,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: WHITE_COLOR,
                          ),
                        ),
                        Obx(
                          () => Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Gender",
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              CustomRadioButton(
                                title: "Male",
                                groupValue: controller.genderType.value,
                                value: Gender.male,
                                onChanged: (val) {
                                  controller.genderType.value = val as Gender;
                                },
                              ),
                              CustomRadioButton(
                                title: "Female",
                                groupValue: controller.genderType.value,
                                value: Gender.female,
                                onChanged: (val) {
                                  controller.genderType.value = val as Gender;
                                },
                              ),
                            ],
                          ),
                        ),
                        CustomTextField(
                          keyboardType: TextInputType.number,
                          controller: controller.phoneNoController,
                          validator: controller.validPhoneNo,
                          labelText: "Phone No",
                          prefixIcon: const Icon(
                            Icons.phone,
                            color: WHITE_COLOR,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(() => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 16,
                                  width: 16,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                          color: WHITE_COLOR, width: 1)),
                                  child: Transform.scale(
                                    scale: 0.6,
                                    child: Checkbox(
                                      value: controller.check.value,
                                      onChanged: controller.toggleCheck,
                                      activeColor: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "I agree the ",
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero),
                                  onPressed: () {},
                                  child: Text(
                                    "Terms & Condition",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3!
                                        .copyWith(
                                          decoration: TextDecoration.underline,
                                        ),
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          navigation: () {
                            
                            controller.register();
                          },
                          text: "REGISTER",
                          textColor: RED_COLOR700,
                          backgroundColor: WHITE_COLOR,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          onLoading: OnLoading(
            loadingText: "Please wait...",
          ),
        ),
      ),
    );
  }
}
