import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common_controllers/global_controller.dart';
import '../../../components/dialog_boxes/simple_alert_dialog.dart';
import '../../../components/snackbars/small_snackbar.dart';
import '../../../constants/colors.dart';
import '../../../constants/fonts.dart';
import '../models/reset_password_response_model.dart';
import '../repositories/my_account_provider.dart';

class MyAccountController extends GetxController with StateMixin<dynamic> {
  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }

  File? pickedImage;

  //* Form keys
  final resetPasswordFormKey = GlobalKey<FormState>();
  final editProfileFormKey = GlobalKey<FormState>();

  //* Text fields controllers
  TextEditingController firstNameController = TextEditingController(
    text: Get.find<GlobalController>().userData.data!.userData!.firstName,
  );
  TextEditingController lastNameController = TextEditingController(
    text: Get.find<GlobalController>().userData.data!.userData!.lastName,
  );
  TextEditingController emailController = TextEditingController(
    text: Get.find<GlobalController>().userData.data!.userData!.email,
  );

  TextEditingController phoneNoController = TextEditingController(
    text: Get.find<GlobalController>().userData.data!.userData!.phoneNo,
  );
  TextEditingController dobControlller = TextEditingController(
    text: Get.find<GlobalController>().userData.data!.userData!.dob,
  );
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  //* Validation methods

  String? validFirstName(String? fname) {
    if (fname!.length < 3) {
      return "First Name atleast have 3 characters";
    } else {
      return null;
    }
  }

  String? validLastName(String? lname) {
    if (lname!.length < 3) {
      return "Last Name atleast have 3 characters";
    } else {
      return null;
    }
  }

  String? validPhoneNo(String? phone) {
    if (phone!.length < 10) {
      return "Enter a valid phone. no";
    } else {
      return null;
    }
  }

  String? validEmail(email) {
    if (email!.isEmpty || email == null) {
      return "Email Field cann't be Empty";
    } else if (!emailRex.hasMatch(email)) {
      return "Enter a valid Email";
    }
    return null;
  }

  String? validDOB(dob) {
    if (dob!.isEmpty || dob == null) {
      return "DOB cann't be Empty";
    } else if (!dobRex.hasMatch(dob)) {
      return "Enter valid DOB";
    }
    return null;
  }

  String? validPassword(String? cpass) {
    if (oldPasswordController.text.isEmpty ||
        oldPasswordController.text.length < 6) {
      return "Password length can't be less then 6";
    } else {
      return null;
    }
  }

  String? validNewPassword(String? cpass) {
    if (passwordController.text != confirmPasswordController.text ||
        passwordController.text.isEmpty) {
      return "Password does not match";
    } else if (passwordController.text.length < 6) {
      return "Password length can't be less then 6";
    } else {
      return null;
    }
  }

  //* Other methods ----->>>>>>>>>>

  //* Pic image from camera   ---->>>>>>>>>>>>
  void _openCamera(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    Get.back();
    if (pickedFile != null) {
      pickedImage = File(pickedFile.path);
    } else {
      pickedImage = null;
    }
    update();
  }

  //* Pic image from gallery >>>>>>>>>>>>
  void _openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    Get.back();
    if (pickedFile != null) {
      pickedImage = File(pickedFile.path);
    } else {
      pickedImage = null;
    }
    update();
  }

  //* Image picker Alert Dialog >>>>>>>>>
  Future<void> picImage(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            title: Text(
              "Choose option",
              style: TextStyle(
                color: BLACK_COLOR.withOpacity(0.6),
                fontFamily: Font.GothamBold,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  ListTile(
                    onTap: () {
                      _openGallery(context);
                    },
                    title: const Text(
                      "Gallery",
                      style: TextStyle(
                        color: BLACK_COLOR,
                        fontFamily: Font.Gotham,
                      ),
                    ),
                    leading: const Icon(
                      Icons.account_box,
                      color: RED_COLOR700,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      _openCamera(context);
                    },
                    title: const Text(
                      "Camera",
                      style: TextStyle(
                        color: BLACK_COLOR,
                        fontFamily: Font.Gotham,
                      ),
                    ),
                    leading: const Icon(
                      Icons.camera,
                      color: RED_COLOR700,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  //* Edit user profile info
  Future<void> editProfileInfo() async {
    if (pickedImage == null) {
      smallSnackbar(text: "Please select an image");
    } else {
      if (editProfileFormKey.currentState!.validate()) {
        Get.dialog(SimpleAlertDialog(
          title: "Update details",
          bodyText: "Are you sure?",
          popButtonText: "No",
          okText: "Yes",
          onPressedOk: () async {
            Get.back();
            change(null, status: RxStatus.loading());
            final imageData =
                convertImageToBase64(imagePath: pickedImage!.path);

            FormData profileUpdateData = FormData({
              "first_name": firstNameController.text,
              "last_name": lastNameController.text,
              "email": emailController.text,
              "phone_no": phoneNoController.text,
              "dob": dobControlller.text,
              "profile_pic": imageData,
            });

            final profileUpdateResponse =
                await MyAccountProvider().updateProfile(profileUpdateData);
            change(null, status: RxStatus.success());
            if (profileUpdateResponse.status == 200) {
              await Get.find<GlobalController>().fetchUserData();
              pickedImage = null;
              Get.back();
              smallSnackbar(
                text: profileUpdateResponse.userMsg!,
                textColor: WHITE_COLOR,
                backgroundColor: GREEN_COLOR,
                backgroundColorOpacity: 1,
              );
            } else {
              smallSnackbar(
                text:
                    "${profileUpdateResponse.userMsg!} | Status : ${profileUpdateResponse.status}",
              );
            }
          },
        ));
      }
    }
    // pickedImage = null;
  }

  String convertImageToBase64({required imagePath}) {
    final bytes = File(imagePath).readAsBytesSync();
    return "data:image/jpg;base64," + base64Encode(bytes);
  }

  //* Reset password
  Future<void> resetPassword() async {
    if (resetPasswordFormKey.currentState!.validate()) {
      change(null, status: RxStatus.loading());
      ResetPasswordResponseModel resetPasswordResponse =
          await MyAccountProvider().resetPassword(FormData({
        "old_password": oldPasswordController.text,
        "password": passwordController.text,
        "confirm_password": confirmPasswordController.text,
      }));
      change(null, status: RxStatus.success());

      if (resetPasswordResponse.status == 200) {
        Get.back();
        smallSnackbar(
          text: resetPasswordResponse.userMsg!,
          textColor: WHITE_COLOR,
          backgroundColor: GREEN_COLOR,
          backgroundColorOpacity: 1,
        );
      } else {
        smallSnackbar(
          text:
              "${resetPasswordResponse.userMsg!} | Status : ${resetPasswordResponse.status}",
        );
      }
    }
  }

  RegExp emailRex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  RegExp dobRex = RegExp(
      r'^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$');
}
