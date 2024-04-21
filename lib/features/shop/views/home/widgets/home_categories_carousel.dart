import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/cards/verticat_image_text_card.dart';
import 'package:flutter_t_store/features/shop/views/sub_category/sub_category.dart';
import 'package:flutter_t_store/utils/constants/image_strings.dart';
import 'package:get/get.dart';

class HomeCategoriesCarousel extends StatelessWidget {
  const HomeCategoriesCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return VerticalImageTextCard(
              image: UtImages.shoeIcon,
              title: "Shoe category",
              onTap: () => Get.to(() => const SubCategoryScreen()),
            );
          }),
    );
  }
}
