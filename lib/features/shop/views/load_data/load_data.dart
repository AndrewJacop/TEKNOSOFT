import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/appbar/custom_appbar.dart';
import 'package:flutter_t_store/common/widgets/text/section_heading.dart';
import 'package:flutter_t_store/data/repositories/banners/banners_repository.dart';
import 'package:flutter_t_store/data/repositories/categories/category_repository.dart';
import 'package:flutter_t_store/data/repositories/dummy_data.dart';
import 'package:flutter_t_store/features/shop/views/load_data/widgets/upload_data_tile.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoadDataScreen extends StatelessWidget {
  const LoadDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryRepository = Get.put(CategoryRepository());
    final bannerRepository = Get.put(BannerRepository());
    // final productRepository = Get.put(ProductRepository());
    // final brandRepository = Get.put(BrandRepository());
    // final subRecordRepository = Get.put(SubRecordRepository());
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          "Upload Data",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: UtSizes.defaultSpace, vertical: UtSizes.md),
          child: Column(
            children: [
              const SectionHeading(
                title: "Main Record",
                showActionButton: false,
              ),
              const SizedBox(
                height: UtSizes.spaceBtwItems,
              ),
              UploadDataTile(
                text: "Upload Categories",
                icon: Iconsax.box,
                onTap: () => categoryRepository.uploadDummyData(DummyData.categories),
              ),
              UploadDataTile(
                text: "Upload Banners",
                icon: Iconsax.shop,
                onTap: () => bannerRepository.uploadDummyData(DummyData.banners),
              ),
              // UploadDataTile(
              //   text: "Upload Products",
              //   icon: Iconsax.shopping_bag,
              //   onTap: () => productRepository.uploadDummyData(TDummyData.products),
              // ),
              // UploadDataTile(
              //   text: "Upload Brands",
              //   icon: Iconsax.gallery,
              //   onTap: () => brandRepository.uploadDummyData(TDummyData.brands),
              // ),
              // const SizedBox(
              //   height: UtSizes.spaceBtwItems,
              // ),
              // const TSectionHeading(
              //   title: "Sub Record",
              //   showActionButton: false,
              // ),
              const Text("Make sure you have already uploaded the content above"),
              const SizedBox(
                height: UtSizes.spaceBtwItems,
              ),
              // UploadDataTile(
              //   text: "Upload Brands & Categories Relation Data",
              //   icon: Iconsax.link,
              //   onTap: () => subRecordRepository.uploadBrandCategoryDummyData(TDummyData.brandCategorys),
              // ),
              // UploadDataTile(
              //   text: "Upload Product Categories Relation Data",
              //   icon: Iconsax.link,
              //   onTap: () => subRecordRepository.uploadProductCategoryDummyData(TDummyData.productCategorys),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
