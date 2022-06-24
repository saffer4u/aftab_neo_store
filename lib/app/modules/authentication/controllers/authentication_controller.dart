import '../models/api_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/enums.dart';
import '../../../components/snackbars/small_snackbar.dart';
import '../models/register_model.dart';
import '../repositories/user_auth_provider.dart';

class AuthenticationController extends GetxController with StateMixin<dynamic> {
  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }

  //* Observable varialbes -------------->>>>>>>>>>>>
  var genderType = Gender.male.obs;
  var check = false.obs;

  //* Form Keys
  final registrationFormKey = GlobalKey<FormState>();

  //*Controllers ------------- >>>>>>>>>>>
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void toggleCheck(bool? val) {
    check.value = val!;
  }

  //* Form Validation methods ------------------>>>>>>>>>>>>>

  String? validpassword(String? value) {
    if (value!.length < 6) {
      return "Password must contain Special, Captial, Small and Numeric Characters";
    } else {
      return null;
    }
  }

  String? validFirstName(String? fname) {
    if (fname!.length < 3) {
      return "First Name atleast have 3 characters";
    } else {
      return null;
    }
  }

  String? validConfirmPassword(String? cpass) {
    if (confirmPasswordController.text != passwordController.text ||
        confirmPasswordController.text.isEmpty) {
      return "Password does not match";
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

  //* Other methods ---------->>>>>>>>>
  register() async {
    if (registrationFormKey.currentState!.validate()) {
      if (check.value == false) {
        smallSnackbar(
          text: "Please agree with terms & condition",
          duration: 2,
        );
      } else {
        //* Convert row data to object
        RegisterModel newUser = RegisterModel(
          first_name: firstNameController.text,
          last_name: lastNameController.text,
          email: emailController.text.trim(),
          gender: genderType.value == Gender.male ? "M" : "F",
          phone_no: int.parse(phoneNoController.text.trim()),
          password: passwordController.text.trim(),
          confirm_password: confirmPasswordController.text.trim(),
        );
        // log(newUser.toString());
        //* Start loading screen
        change(null, status: RxStatus.loading());
        //* Post data and get response from server
        ApiResponse registrationResponse =
            await UserAuthProvider().registerUser(newUser);
        if (registrationResponse.status == 200) {
          change(registrationResponse, status: RxStatus.success());
        } else {
          change(registrationResponse, status: RxStatus.error());
        }
      }
    }
  }

  RegExp emailRex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
}
