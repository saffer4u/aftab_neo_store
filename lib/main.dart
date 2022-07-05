import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/common_controllers/auth_set_screen.dart';
import 'app/common_controllers/global_controller.dart';
import 'app/components/progress_indicaters/app_loading.dart';
import 'app/components/theme.dart';
import 'app/components/widgets/background_image.dart';
import 'app/constants/colors.dart';
import 'app/routes/app_pages.dart';



void main() {
 
  WidgetsFlutterBinding.ensureInitialized();

 
 

  //* Controller for global methods
  //* - Get user data from any Screen
  Get.put<GlobalController>(GlobalController());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "NeoStore",
      theme: appThemeData,
      getPages: AppPages.routes,
      home: Scaffold(
        backgroundColor: RED_COLOR800,
        body: BackgroundImage(
          child: AppLoading(loadingText: "Loading..."),
        ),
      ),
    ),
  );
   //* Set screen on the basis of user state defined in this controller
   Get.put(AuthSetScreenController());
}
