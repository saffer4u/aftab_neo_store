import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/common_controllers/auth_set_screen.dart';
import 'app/components/progress_indicaters/app_loading.dart';
import 'app/components/theme.dart';
import 'app/components/widgets/background_image.dart';
import 'app/constants/colors.dart';
import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //* Set screen on the basis of user auth
  Get.put(AuthSetScreenController());
  runApp(
    GetMaterialApp(
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
}
