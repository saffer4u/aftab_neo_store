import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_controllers/global_controller.dart';
import '../../../components/progress_indicaters/on_loading.dart';
import '../../../components/widgets/appbar.dart';
import '../../../components/widgets/custom_text.dart';
import '../../../components/widgets/on_error.dart';
import '../../../components/widgets/rating.dart';
import '../../../constants/colors.dart';
import '../../../constants/fonts.dart';
import '../controllers/product_list_controller.dart';
import '../models/product_list_model.dart';

class ProductListView extends GetView<ProductListController> {
  const ProductListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          text: Get.find<GlobalController>()
              .userData
              .data!
              .productCategories![controller.categoryId - 1]!
              .name!),
      body: controller.obx(
        (state) {
          final products = state as ProductsListModel;
          return ListView.separated(
            physics: BouncingScrollPhysics(),
            itemCount: products.data!.length,
            separatorBuilder: (_, index) {
              return Divider(
                height: 0,
              );
            },
            itemBuilder: (_, index) {
              return InkWell(
                onTap: () => controller.onPressedProductTile(
                  productId: products.data![index].id!,
                  productIndex: index,
                ),
                child: Card(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Image.network(
                            products.data![index].productImages!,
                            fit: BoxFit.cover,
                            loadingBuilder: Get.find<GlobalController>().loadingBuilder,
                          ),
                          height: 100,
                          width: 120,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 144,
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: products.data![index].name!,
                              color: BLACK_COLOR,
                              size: 16,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: CustomText(
                                text: products.data![index].producer!,
                                color: Colors.grey.shade700,
                                size: 13,
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: CustomText(
                                    text:
                                        "Rs. ${products.data![index].cost!.toString()}",
                                    color: RED_COLOR700,
                                    fontName: Font.GothamBold,
                                    size: 16,
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: AbsorbPointer(
                                    child: Rating(
                                      rating: products.data![index].rating!
                                          .toDouble(),
                                      iconSize: 20,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        onLoading: OnLoading(
          loadingText: "Please wait...",
        ),
        onError: (_) => OnError(
          errText: "Something went wrong",
          onRefresh: controller.fetchProductList,
        ),
      ),
    );
  }
}
