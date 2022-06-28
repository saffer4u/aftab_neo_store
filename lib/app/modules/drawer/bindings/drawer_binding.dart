import 'package:aftab_neo_store/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../controllers/drawer_controller.dart';

class DrawerBinding extends Bindings {
  @override
  void dependencies() {
 
    //* Both controllers are needed to initialized
    Get.put<HomeController>(HomeController());
    Get.put<MainDrawerController>(MainDrawerController());
  }
}
