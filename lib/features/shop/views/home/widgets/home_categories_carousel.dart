import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/cards/verticat_image_text_card.dart';
import 'package:flutter_t_store/common/widgets/loaders/category_shimmer.dart';
import 'package:flutter_t_store/features/shop/controllers/category_controller.dart';
import 'package:flutter_t_store/features/shop/views/sub_category/sub_category.dart';
import 'package:get/get.dart';

class HomeCategoriesCarousel extends StatelessWidget {
  const HomeCategoriesCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Obx(() {
      if (controller.isLoading.value) return const CategoryShimmer();
      if (controller.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            'No categories found',
            style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),
          ),
        );
      }
      return SizedBox(
        height: 80,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.featuredCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final category = controller.featuredCategories[index];
              return VerticalImageTextCard(
                image: category.image,
                title: category.name,
                onTap: () => Get.to(() => const SubCategoryScreen()),
              );
            }),
      );
    });
  }
}
