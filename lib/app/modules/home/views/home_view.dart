import 'dart:developer';

import 'package:aftab_neo_store/app/modules/drawer/controllers/drawer_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../common_controllers/auth_set_screen.dart';
import '../../../components/widgets/appbar.dart';
import '../../../components/widgets/home_grid_item.dart';
import '../../../constants/colors.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        text: "NeoSTORE",
        size: 16,
        action: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              log("Logout button pressed");
              await Get.find<AuthSetScreenController>().setToken(null);
            },
          )
        ],
        leading: InkWell(
          onTap: Get.find<MainDrawerController>().toggleDrawer,
          child: const Icon(
            Icons.menu,
          ),
        ),
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              CarouselSlider.builder(
                itemCount: controller.urlImages.length,
                itemBuilder: (context, index, realIndex) {
                  return Image.network(
                    controller.urlImages[index],
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        color: GREY_COLOR.withOpacity(0.5),
                        child: Center(
                          child: CircularProgressIndicator(
                            backgroundColor: RED_COLOR700,
                            color: BLACK_COLOR,
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        ),
                      );
                    },
                  );
                },
                options: CarouselOptions(
                  height: 250,
                  autoPlay: true,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) =>
                      controller.activeIndex.value = index,
                  autoPlayInterval: Duration(seconds: 2),
                ),
              ),
              Obx(
                () => Positioned(
                  bottom: 10,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: AnimatedSmoothIndicator(
                      effect: SlideEffect(
                        strokeWidth: 2,
                        dotHeight: 10,
                        dotWidth: 10,
                        activeDotColor: BLACK_COLOR,
                        dotColor: RED_COLOR800,
                      ),
                      count: controller.urlImages.length,
                      activeIndex: controller.activeIndex.value,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: controller.homeGridItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return HomeGridItem(
                    iconPosition: controller.homeGridItems[index].iconPosition,
                    titlePosition:
                        controller.homeGridItems[index].titlePosition,
                    title: controller.homeGridItems[index].title,
                    icon: controller.homeGridItems[index].icon,
                    edgeSpacing: controller.homeGridItems[index].edgeSpacing,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
