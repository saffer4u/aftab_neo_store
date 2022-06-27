import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_controllers/auth_set_screen.dart';
import '../../../components/enums.dart';
import '../../../components/snackbars/small_snackbar.dart';
import '../../../constants/colors.dart';
import '../models/api_response_model.dart';
import '../models/login_model.dart';
import '../models/register_model.dart';
import '../repositories/user_auth_provider.dart';

class AuthenticationController extends GetxController with StateMixin<dynamic> {
  @override
  void onInit() {
    //* change is used to start and stop loading screen
    //* RxStatus.loading() - Start loading screen - Default
    //* RxStatus.success() - Stop loading screen
    change(null, status: RxStatus.success());
    super.onInit();
  }

  //* Variables ---------->>>>>>>>>>>
  AuthScreen authScreen = AuthScreen.login;

  //* Observable varialbes -------------->>>>>>>>>>>>
  var genderType = Gender.male.obs;
  var check = false.obs;

  //* Form Keys
  final registrationFormKey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();
  final forgetPasswordFormKey = GlobalKey<FormState>();

  //*Controllers ------------- >>>>>>>>>>>
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  //* Form Validation methods ------------------>>>>>>>>>>>>>>>>>>>>>>>>

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

  //* Other methods ---------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  //* Set views
  void setScreen(AuthScreen screen) {
    authScreen = screen;
    update();
  }

  void toggleCheck(bool? val) {
    check.value = val!;
  }

  //* Register new user to server
  void register() async {
    if (registrationFormKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
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
          setScreen(AuthScreen.login);
          smallSnackbar(
              textColor: WHITE_COLOR,
              backgroundColor: GREEN_COLOR,
              backgroundColorOpacity: 1,
              text:
                  "${(registrationResponse.userMsg) ?? "Registeration successful"} Please login");
        } else {
          change(registrationResponse, status: RxStatus.success());
          if (registrationResponse.status == 422) {
            smallSnackbar(
              text:
                  "${(registrationResponse.userMsg) ?? "User Already Exist"} | Status : ${registrationResponse.status}",
              backgroundColorOpacity: 1,
            );
            setScreen(AuthScreen.login);
          } else {
            smallSnackbar(
              backgroundColorOpacity: 1,
              text:
                  "${(registrationResponse.userMsg) ?? "Something went wrong"} | Status : ${registrationResponse.status}",
            );
          }
        }
        emailController.clear();
        passwordController.clear();
        confirmPasswordController.clear();
      }
    }
  }

  //* Login user
  void login() async {
    if (loginFormKey.currentState!.validate()) {
      log("Login valid");
      FocusManager.instance.primaryFocus?.unfocus();
      LoginModel loginUserData = LoginModel(
        email: emailController.text,
        password: passwordController.text,
      );
      change(null, status: RxStatus.loading());
      ApiResponse loginResponse =
          await UserAuthProvider().loginUser(loginUserData);
      if (loginResponse.status == 200) {
        smallSnackbar(
          textColor: WHITE_COLOR,
          backgroundColor: GREEN_COLOR,
          backgroundColorOpacity: 1,
          text: "${(loginResponse.userMsg) ?? "Login successful"}",
        );
        await Future.delayed(Duration(seconds: 1));
        Get.find<AuthSetScreenController>()
            .setToken(loginResponse.data!.accessToken);
      } else {
        change(loginResponse, status: RxStatus.success());

        smallSnackbar(
          text:
              "${(loginResponse.userMsg) ?? "Login unsuccessful"} | Status : ${loginResponse.status}",
          backgroundColorOpacity: 1,
        );
      }
    }
  }

  void forgetPassword() async {
    if (forgetPasswordFormKey.currentState!.validate()) {
      log("Forget password called");
      FocusManager.instance.primaryFocus?.unfocus();
      change(null, status: RxStatus.loading());
      FormData userMail = FormData({'email': emailController.text});
      ApiResponse forgetPassResp =
          await UserAuthProvider().forgetPassword(userMail);

      if (forgetPassResp.status == 200) {
        change(forgetPassResp, status: RxStatus.success());
        smallSnackbar(
          textColor: WHITE_COLOR,
          backgroundColor: GREEN_COLOR,
          backgroundColorOpacity: 1,
          text: "${(forgetPassResp.userMsg) ?? "Email sent successfully"}",
        );
        setScreen(AuthScreen.login);
      } else {
        change(forgetPassResp, status: RxStatus.success());

        smallSnackbar(
          text:
              "${(forgetPassResp.userMsg) ?? "Login unsuccessful"} | Status : ${forgetPassResp.status}",
          backgroundColorOpacity: 1,
        );
      }
      emailController.clear();
      passwordController.clear();
    }
  }

  RegExp emailRex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
}
