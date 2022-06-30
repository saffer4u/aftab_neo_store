import '../../../common_controllers/global_controller.dart';
import '../../../components/widgets/appbar.dart';
import '../../../constants/colors.dart';
import '../../../constants/fonts.dart';
import 'package:aftab_neo_store/app/modules/product_detail/models/product_details_model.dart';
import 'package:aftab_neo_store/app/modules/product_list/controllers/product_list_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/progress_indicaters/on_loading.dart';
import '../../../components/widgets/customButton.dart';
import '../../../components/widgets/custom_text.dart';
import '../../../components/widgets/on_error.dart';
import '../../../components/widgets/rating.dart';
import '../controllers/product_detail_controller.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  const ProductDetailView({Key? key}) : super(key: key);
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
          return Column(
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
                        padding: const EdgeInsets.symmetric(vertical: 1.5),
                        child: CustomText(
                          text:
                              "Catagory - ${Get.find<GlobalController>().userData.data!.productCategories![Get.find<ProductListController>().categoryId - 1]!.name!}",
                          size: 17,
                          fontName: Font.Gotham,
                          color: BLACK_COLOR.withOpacity(0.87),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: WHITE_COLOR,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Rs. ${detail.data!.cost.toString()}",
                                color: RED_COLOR700,
                                size: 20,
                              ),
                              Icon(Icons.share),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(color: GREY_COLOR.shade200)),
                          width: MediaQuery.of(context).size.width - 50,
                          child: GetBuilder<ProductDetailController>(
                            builder: (_) {
                              return Image.network(
                                controller
                                    .productDetails
                                    .data!
                                    .productImages![controller.imageIndex]
                                    .image!,
                                fit: BoxFit.contain,
                                loadingBuilder:
                                    Get.find<GlobalController>().loadingBuilder,
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: detail.data!.productImages!.length,
                              itemBuilder: (state, index) {
                                return InkWell(
                                  onTap: () =>
                                      controller.selectImage(index: index),
                                  child: GetBuilder<ProductDetailController>(
                                    builder: (_) {
                                      return Container(
                                        padding: EdgeInsets.all(5),
                                        width: 200,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                          color: controller.imageIndex == index
                                              ? RED_COLOR700
                                              : GREY_COLOR.shade200,
                                        )),
                                        child: Image.network(
                                          detail.data!.productImages![index]
                                              .image!,
                                          fit: BoxFit.contain,
                                          loadingBuilder:
                                              Get.find<GlobalController>()
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
                        ),
                        const Divider(),
                        Expanded(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Row(
                                  children: [
                                    CustomText(
                                      text: "DESCRIPTION",
                                      color: BLACK_COLOR.withOpacity(0.87),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 10),
                                child: CustomText(
                                  text: detail.data!.description!,
                                  fontName: Font.Gotham,
                                  size: 12,
                                  color: BLACK_COLOR.withOpacity(0.57),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: WHITE_COLOR),
                  width: MediaQuery.of(context).size.width - 30,
                  height: 60,
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                            verticalPadding: 5,
                            horizontalPadding: 5,
                            text: "BUY NOW",
                            textColor: WHITE_COLOR,
                            backgroundColor: RED_COLOR700),
                      ),
                      Expanded(
                        child: CustomButton(
                            navigation: () =>
                                controller.rating(),
                            verticalPadding: 5,
                            horizontalPadding: 5,
                            text: "RATE",
                            textColor: BLACK_COLOR.withOpacity(0.57),
                            backgroundColor: Colors.grey.shade300),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
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
