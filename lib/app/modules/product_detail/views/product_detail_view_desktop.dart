import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_controllers/global_controller.dart';
import '../../../components/progress_indicaters/on_loading.dart';
import '../../../components/widgets/appbar.dart';
import '../../../components/widgets/customButton.dart';
import '../../../components/widgets/custom_text.dart';
import '../../../components/widgets/on_error.dart';
import '../../../components/widgets/rating.dart';
import '../../../constants/colors.dart';
import '../../../constants/fonts.dart';
import '../../product_list/controllers/product_list_controller.dart';
import '../controllers/product_detail_controller.dart';
import '../models/product_details_model.dart';

class ProductDetailViewDesktop extends GetView<ProductDetailController> {
  const ProductDetailViewDesktop({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          text: Get.find<ProductListController>()
              .productList
              .data![controller.productIndex]
              .name!),
      body: controller.obx(
        (state) {
          final detail = state as ProductDetailsModel;

          return LayoutBuilder(builder: (context, cnstrn) {
            return CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          color: WHITE_COLOR,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: detail.data!.name!,
                                  size: 23,
                                  fontName: Font.GothamBold,
                                  color: BLACK_COLOR.withOpacity(0.87),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 1.5),
                                  child: CustomText(
                                    text:
                                        "Catagory - ${Get.find<GlobalController>().userData.data!.productCategories![Get.find<ProductListController>().categoryId - 1]!.name!}",
                                    size: 17,
                                    fontName: Font.Gotham,
                                    color: BLACK_COLOR.withOpacity(0.87),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: detail.data!.producer!,
                                      size: 12,
                                      fontName: Font.Gotham,
                                      color: BLACK_COLOR.withOpacity(0.87),
                                    ),
                                    AbsorbPointer(
                                      child: Rating(
                                        rating: detail.data!.rating!.toDouble(),
                                        iconSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: WHITE_COLOR,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        text:
                                            "Rs. ${detail.data!.cost.toString()}",
                                        color: RED_COLOR700,
                                        size: 20,
                                      ),
                                      Icon(Icons.share),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: GREY_COLOR.shade200),
                                      ),
                                      height: cnstrn.maxWidth < 900
                                          ? Get.size.width * 0.6
                                          : 600,
                                      child:
                                          GetBuilder<ProductDetailController>(
                                        builder: (_) {
                                          return Image.network(
                                            controller
                                                .productDetails
                                                .data!
                                                .productImages![
                                                    controller.imageIndex]
                                                .image!,
                                            fit: BoxFit.contain,
                                            loadingBuilder:
                                                Get.find<GlobalController>()
                                                    .loadingBuilder,
                                          );
                                        },
                                      ),
                                    ),
                                    Container(
                                      width: Get.size.width * 0.4,
                                      height: 100,
                                      child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        itemCount:
                                            detail.data!.productImages!.length,
                                        itemBuilder: (state, index) {
                                          return InkWell(
                                            onTap: () => controller.selectImage(
                                                index: index),
                                            child: GetBuilder<
                                                ProductDetailController>(
                                              builder: (_) {
                                                return Container(
                                                  padding: EdgeInsets.all(5),
                                                  width: 200,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                    color: controller
                                                                .imageIndex ==
                                                            index
                                                        ? RED_COLOR700
                                                        : GREY_COLOR.shade200,
                                                  )),
                                                  child: Image.network(
                                                    detail
                                                        .data!
                                                        .productImages![index]
                                                        .image!,
                                                    fit: BoxFit.contain,
                                                    loadingBuilder: Get.find<
                                                            GlobalController>()
                                                        .loadingBuilder,
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return SizedBox(
                                            width: 10,
                                          );
                                        },
                                      ),
                                    ),
                                    const Divider(),
                                    SizedBox(
                                      width: Get.size.width * 0.4,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15.0),
                                            child: CustomText(
                                              text: "DESCRIPTION",
                                              color: BLACK_COLOR
                                                  .withOpacity(0.87),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15.0, vertical: 10),
                                            child: CustomText(
                                              text: detail.data!.description!,
                                              fontName: Font.Gotham,
                                              size: 12,
                                              color:
                                                  BLACK_COLOR.withOpacity(0.57),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    SizedBox(
                                      width: Get.size.width * 0.4,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: CustomButton(
                                                navigation: controller.buyNow,
                                                verticalPadding: 5,
                                                horizontalPadding: 5,
                                                text: "BUY NOW",
                                                textColor: WHITE_COLOR,
                                                backgroundColor: RED_COLOR700),
                                          ),
                                          CustomButton(
                                            navigation: controller.rating,
                                            verticalPadding: 5,
                                            horizontalPadding: 5,
                                            text: "RATE",
                                            textColor:
                                                BLACK_COLOR.withOpacity(0.57),
                                            backgroundColor:
                                                Colors.grey.shade300,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          });
        },
        onLoading: OnLoading(
          loadingText: "Please wait...",
        ),
        onError: (_) => OnError(
          errText: "Something went wrong",
          onRefresh: controller.fetchProductDetails,
        ),
      ),
    );
  }
}
