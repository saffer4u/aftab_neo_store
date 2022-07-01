import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../common_controllers/global_controller.dart';
import '../../../components/widgets/appbar.dart';
import '../../../constants/colors.dart';
import '../../drawer/controllers/drawer_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // * Get fetched categories form API
    final productCategories =
        Get.find<GlobalController>().userData.data!.productCategories!;
    return Scaffold(
      appBar: customAppBar(
        text: "NeoSTORE",
        size: 16,
        action: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              log("Search button pressed");
              // await Get.find<AuthSetScreenController>().setToken(null);
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
                    loadingBuilder: Get.find<GlobalController>().loadingBuilder,
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
                itemCount: productCategories.length,
                itemBuilder: (BuildContext context, int index) {
                  //* Menual categories set Not in use
                  // return HomeGridItem(
                  //   iconPosition: controller.homeGridItems[index].iconPosition,
                  //   titlePosition:
                  //       controller.homeGridItems[index].titlePosition,
                  //   title: controller.homeGridItems[index].title,
                  //   icon: controller.homeGridItems[index].icon,
                  //   edgeSpacing: controller.homeGridItems[index].edgeSpacing,
                  // );

                  return InkWell(
                    onTap: () => controller
                        .onTapHomeGridItem(productCategories[index]!.id!),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: RED_COLOR700, width: 2),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            productCategories[index]!.iconImage!,
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          Spacer(),
                          Container(
                            padding: EdgeInsets.all(10),
                            width: double.infinity,
                            color: RED_COLOR700.withOpacity(0.8),
                            child: Center(
                                child: Text(
                              productCategories[index]!.name!,
                              style: Theme.of(context).textTheme.headline6,
                            )),
                          ),
                        ],
                      ),
                    ),
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
