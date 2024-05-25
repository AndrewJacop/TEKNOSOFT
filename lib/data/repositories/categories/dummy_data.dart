import '../../../features/shop/models/category_model.dart';
import '../../../utils/constants/image_strings.dart';

class DummyData {
  static final List<CategoryModel> categories = [
    CategoryModel(id: '1', image: UtImages.sportIcon, name: 'Sports', isFeatured: true),
    CategoryModel(id: '5', image: UtImages.furnitureIcon, name: 'Furniture', isFeatured: true),
    CategoryModel(id: '2', image: UtImages.electronicsIcon, name: 'Electronics', isFeatured: true),
    CategoryModel(id: '3', image: UtImages.clothIcon, name: 'Clothes', isFeatured: true),
    CategoryModel(id: '4', image: UtImages.animalIcon, name: 'Animals', isFeatured: true),
    CategoryModel(id: '6', image: UtImages.shoeIcon, name: 'Shoes', isFeatured: true),
    CategoryModel(id: '7', image: UtImages.cosmeticsIcon, name: 'Cosmetics', isFeatured: true),
    CategoryModel(id: '14', image: UtImages.jeweleryIcon, name: 'Jewellery', isFeatured: true),

    // Subcategories
    // sports
    CategoryModel(id: '8', image: UtImages.sportIcon, name: 'Sports Shoes', parentId: '1', isFeatured: false),
    CategoryModel(id: '9', image: UtImages.sportIcon, name: 'Track Suits', parentId: '1', isFeatured: false),
    CategoryModel(id: '10', image: UtImages.sportIcon, name: 'Sports Equipment', parentId: '1', isFeatured: false),
    // furniture
    CategoryModel(id: '11', image: UtImages.furnitureIcon, name: 'Sports Shoes', parentId: '5', isFeatured: false),
    CategoryModel(id: '12', image: UtImages.furnitureIcon, name: 'Track Suits', parentId: '5', isFeatured: false),
    CategoryModel(id: '13', image: UtImages.furnitureIcon, name: 'Sports Equipment', parentId: '5', isFeatured: false),
    // electronics
    CategoryModel(id: '14', image: UtImages.electronicsIcon, name: 'Laptops', parentId: '2', isFeatured: false),
    CategoryModel(id: '15', image: UtImages.electronicsIcon, name: 'Mobile', parentId: '2', isFeatured: false),
    // clothes
    CategoryModel(id: '16', image: UtImages.clothIcon, name: 'T-Shirts', parentId: '3', isFeatured: false),
  ];
}
// import '../features/shop/models/banner_model.dart';
// import '../features/shop/models/brand_model.dart';
// import '../features/shop/models/category_model.dart';
// import '../features/shop/models/product_attribute_model.dart';
// import '../features/shop/models/product_model.dart';
// import '../features/shop/models/product_variation_model.dart';
// import '../routes/routes.dart';
// import '../utils/constants/image_strings.dart';

// class TDummyData {
//   /// -- Banners
//   static final List<BannerModel> banners = [
//     BannerModel(imageUrl: TImages.banner1, targetScreen: TRoutes.order, active: false),
//     BannerModel(imageUrl: TImages.banner2, targetScreen: TRoutes.cart, active: true),
//     BannerModel(imageUrl: TImages.banner3, targetScreen: TRoutes.favourites, active: true),
//     BannerModel(imageUrl: TImages.banner4, targetScreen: TRoutes.search, active: true),
//     BannerModel(imageUrl: TImages.banner5, targetScreen: TRoutes.settings, active: true),
//     BannerModel(imageUrl: TImages.banner6, targetScreen: TRoutes.userAddress, active: true),
//     BannerModel(imageUrl: TImages.banner8, targetScreen: TRoutes.checkout, active: false),
//   ];

//   /// -- List of all Categories
//   static final List<CategoryModel> categories = [
//     CategoryModel(id: '1', image: TImages.sportIcon, name: 'Sports', isFeatured: true),
//     CategoryModel(id: '5', image: TImages.furnitureIcon, name: 'Furniture', isFeatured: true),
//     CategoryModel(id: '2', image: TImages.electronicsIcon, name: 'Electronics', isFeatured: true),
//     CategoryModel(id: '3', image: TImages.clothIcon, name: 'Clothes', isFeatured: true),
//     CategoryModel(id: '4', image: TImages.animalIcon, name: 'Animals', isFeatured: true),
//     CategoryModel(id: '6', image: TImages.shoeIcon, name: 'Shoes', isFeatured: true),
//     CategoryModel(id: '7', image: TImages.cosmeticsIcon, name: 'Cosmetics', isFeatured: true),
//     CategoryModel(id: '14', image: TImages.jeweleryIcon, name: 'Jewelery', isFeatured: true),

//     ///subcategories
//     CategoryModel(id: '8', image: TImages.sportIcon, name: 'Sport Shoes', parentId: '1', isFeatured: false),
//     CategoryModel(id: '9', image: TImages.sportIcon, name: 'Track suits', parentId: '1', isFeatured: false),
//     CategoryModel(id: '10', image: TImages.sportIcon, name: 'Sports Equipments', parentId: '1', isFeatured: false),
//     //furniture
//     CategoryModel(id: '11', image: TImages.furnitureIcon, name: 'Bedroom furniture', parentId: '5', isFeatured: false),
//     CategoryModel(id: '12', image: TImages.furnitureIcon, name: 'Kitchen furniture', parentId: '5', isFeatured: false),
//     CategoryModel(id: '13', image: TImages.furnitureIcon, name: 'Office furniture', parentId: '5', isFeatured: false),
//     //electronics
//     CategoryModel(id: '14', image: TImages.electronicsIcon, name: 'Laptop', parentId: '2', isFeatured: false),
//     CategoryModel(id: '15', image: TImages.electronicsIcon, name: 'Mobile', parentId: '2', isFeatured: false),
//     CategoryModel(id: '16', image: TImages.clothIcon, name: 'Shirts', parentId: '3', isFeatured: false)
//   ];

//   static final List<ProductModel> products = [
//     ProductModel(
//       id: '001',
//       title: 'Green Nike sports shoe',
//       stock: 15,
//       price: 135,
//       isFeatured: true,
//       thumbnail: TImages.productImage1,
//       description: 'Green Nike sports shoe',
//       brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
//       images: [TImages.productImage1, TImages.productImage23, TImages.productImage21, TImages.productImage9],
//       salePrice: 30,
//       sku: 'ABR4568',
//       categoryId: '1',
//       productAttributes: [
//         ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
//         ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
//       ],
//       productVariations: [
//         ProductVariationModel(
//             id: '1',
//             stock: 34,
//             price: 134,
//             salePrice: 122.6,
//             image: TImages.productImage1,
//             description: 'This is a Product description for Green Nike sports shoe.',
//             attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
//         ProductVariationModel(
//           id: '2',
//           stock: 15,
//           price: 132,
//           image: TImages.productImage23,
//           attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
//         ),
//         ProductVariationModel(
//           id: '3',
//           stock: 0,
//           price: 234,
//           image: TImages.productImage23,
//           attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
//         ),
//         ProductVariationModel(
//           id: '4',
//           stock: 222,
//           price: 232,
//           image: TImages.productImage1,
//           attributeValues: {'Color': 'Green', 'Size': 'EU 32'},
//         ),
//         ProductVariationModel(
//           id: '5',
//           stock: 0,
//           price: 334,
//           image: TImages.productImage21,
//           attributeValues: {'Color': 'Red', 'Size': 'EU 34'},
//         ),
//         ProductVariationModel(
//           id: '6',
//           stock: 11,
//           price: 332,
//           image: TImages.productImage21,
//           attributeValues: {'Color': 'Red', 'Size': 'EU 32'},
//         ),
//       ],
//       productType: 'ProductType.variable',
//     ),
//     ProductModel(
//       id: '002',
//       title: 'Blue T-shirt for all ages',
//       stock: 15,
//       price: 35,
//       isFeatured: true,
//       thumbnail: TImages.productImage69,
//       description:
//           'This is a Product description for Blue Nike Sleeve Less vest. There are more things that can be added but i am just practicing and nothing else.',
//       brand: BrandModel(id: '6', image: TImages.zaraLogo, name: 'ZARA'),
//       images: [TImages.productImage68, TImages.productImage69, TImages.productImage5],
//       salePrice: 30,
//       sku: 'ABR4568',
//       categoryId: '16',
//       productAttributes: [
//         ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
//         ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
//       ],
//       productType: 'ProductType.single',
//     ),
//     ProductModel(
//       id: '003',
//       title: 'Leather brown Jacket',
//       stock: 15,
//       price: 38000,
//       isFeatured: false,
//       thumbnail: TImages.productImage64,
//       description:
//           'This is a Product description for Leather brown Jacket. There are more things that can be added but i am just practicing and nothing else.',
//       brand: BrandModel(id: '6', image: TImages.zaraLogo, name: 'ZARA'),
//       images: [TImages.productImage64, TImages.productImage65, TImages.productImage66, TImages.productImage67],
//       salePrice: 30,
//       sku: 'ABR4568',
//       categoryId: '16',
//       productAttributes: [
//         ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
//         ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
//       ],
//       productType: 'ProductType.single',
//     ),
//     ProductModel(
//       id: '004',
//       title: '4 Color collar t-shirt dry fit',
//       stock: 15,
//       price: 135,
//       isFeatured: false,
//       thumbnail: TImages.productImage60,
//       description:
//           'This is a Product description for 4 Color collar t-shirt dry fit. There are more things that can be added but its just a demo and nothing else.',
//       brand: BrandModel(id: '6', image: TImages.zaraLogo, name: 'ZARA'),
//       images: [TImages.productImage60, TImages.productImage61, TImages.productImage62, TImages.productImage63],
//       salePrice: 30,
//       sku: 'ABR4568',
//       categoryId: '16',
//       productAttributes: [
//         ProductAttributeModel(name: 'Color', values: ['Red', 'Yellow', 'Green', 'Blue']),
//         ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
//       ],
//       productVariations: [
//         ProductVariationModel(
//             id: '1',
//             stock: 34,
//             price: 134,
//             salePrice: 122.6,
//             image: TImages.productImage60,
//             description: 'This is a Product description for 4 Color collar t-shirt dry fit',
//             attributeValues: {'Color': 'Red', 'Size': 'EU 34'}),
//         ProductVariationModel(
//             id: '2',
//             stock: 15,
//             price: 132,
//             image: TImages.productImage60,
//             attributeValues: {'Color': 'Red', 'Size': 'EU 32'}),
//         // ProductVariationModel
//         ProductVariationModel(
//             id: '3',
//             stock: 0,
//             price: 234,
//             image: TImages.productImage61,
//             attributeValues: {'Color': 'Yellow', 'Size': 'EU 34'}),
//         // ProductVariationModel
//         ProductVariationModel(
//             id: '4',
//             stock: 222,
//             price: 232,
//             image: TImages.productImage61,
//             attributeValues: {'Color': 'Yellow', 'Size': 'EU 32'}),
//         // ProductVariationModel
//         ProductVariationModel(
//             id: '5',
//             stock: 0,
//             price: 334,
//             image: TImages.productImage62,
//             attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
//         // ProductVariationModel
//         ProductVariationModel(
//             id: '6',
//             stock: 11,
//             price: 332,
//             image: TImages.productImage62,
//             attributeValues: {'Color': 'Green', 'Size': 'EU 30'}),
//         // ProductVariationModel
//         ProductVariationModel(
//             id: '7',
//             stock: 0,
//             price: 334,
//             image: TImages.productImage63,
//             attributeValues: {'Color': 'Blue', 'Size': 'EU 30'}),
//         // ProductVariationModel
//         ProductVariationModel(
//             id: '8',
//             stock: 11,
//             price: 332,
//             image: TImages.productImage63,
//             attributeValues: {'Color': 'Blue', 'Size': 'EU 34'}),
//         // ProductVariationModel
//       ],
//       productType: 'ProductType.variable',
//     ),

//     ///Products after banner
//     ProductModel(
//       id: '005',
//       title: 'Nike Air Jordon Shoes',
//       stock: 15,
//       price: 35,
//       isFeatured: false,
//       thumbnail: TImages.productImage10,
//       description: 'Nike Air Jordon Shoes for running. Quality product, Long Lasting',
//       brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
//       images: [TImages.productImage7, TImages.productImage8, TImages.productImage9, TImages.productImage10],
//       salePrice: 30,
//       sku: 'ABR4568',
//       categoryId: '8',
//       productAttributes: [
//         ProductAttributeModel(name: 'Color', values: ['Orange', 'Black', 'Brown']),
//         ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
//       ],
//       productVariations: [
//         ProductVariationModel(
//             id: '1',
//             stock: 16,
//             price: 36,
//             salePrice: 12.6,
//             image: TImages.productImage8,
//             description:
//                 'Flutter is Googles mobile UI open source framework to build high-quality native (super fast) interfaces for i0s and Android apps with the unified codebase',
//             attributeValues: {'Color': 'Orange', 'Size': 'EU 34'}),
//         // ProductVariationModel
//         ProductVariationModel(
//             id: '2',
//             stock: 15,
//             price: 35,
//             image: TImages.productImage7,
//             attributeValues: {'Color': 'Black', 'Size': 'EU 32'}),
//         // ProductVariationModel
//         ProductVariationModel(
//             id: '3',
//             stock: 14,
//             price: 34,
//             image: TImages.productImage9,
//             attributeValues: {'Color': 'Brown', 'Size': 'EU 34'}),
//         // ProductVariationModel
//         ProductVariationModel(
//             id: '4',
//             stock: 13,
//             price: 33,
//             image: TImages.productImage7,
//             attributeValues: {'Color': 'Black', 'Size': 'EU 34'}),
//         // ProductVariationModel
//         ProductVariationModel(
//             id: '5',
//             stock: 12,
//             price: 32,
//             image: TImages.productImage9,
//             attributeValues: {'Color': 'Brown', 'Size': 'EU 32'}),
//         ProductVariationModel(
//             id: '6',
//             stock: 11,
//             price: 31,
//             image: TImages.productImage8,
//             attributeValues: {'Color': 'Orange', 'Size': 'EU 32'}),
//       ],
//       productType: 'ProductType.variable',
//     ),
//     ProductModel(
//       id: '006',
//       title: 'SAMSUNG Galaxy S9 (Pink, 64 GB) (4 GB RAM)',
//       stock: 15,
//       price: 750,
//       isFeatured: false,
//       thumbnail: TImages.productImage11,
//       description: 'SAMSUNG Galaxy S9 (Pink, 64 GB) (4 GB RAM), Long Battery timing',
//       brand: BrandModel(id: '7', image: TImages.appleLogo, name: 'Samsung'),
//       images: [TImages.productImage11, TImages.productImage12, TImages.productImage13, TImages.productImage12],
//       salePrice: 650,
//       sku: 'ABR4568',
//       categoryId: '2',
//       productAttributes: [
//         ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
//         ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
//       ],
//       productType: 'ProductType.single',
//     ), // ProductModel
//     ProductModel(
//       id: '007',
//       title: 'TOMI Dog food',
//       stock: 15,
//       price: 20,
//       isFeatured: false,
//       thumbnail: TImages.productImage18,
//       description:
//           'This is a Product description for TOMI Dog food. There are more things that can be added but i am just practicing and nothing else.',
//       brand: BrandModel(id: '7', image: TImages.appleLogo, name: 'Tomi'),
//       salePrice: 10,
//       sku: 'ABR4568',
//       categoryId: '4',
//       productAttributes: [
//         ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
//         ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
//       ],
//       productType: 'ProductType.single',
//     ),
//     ProductModel(
//       id: '009',
//       title: 'Nike Air Jordon 19 Blue',
//       stock: 15,
//       price: 400,
//       isFeatured: false,
//       thumbnail: TImages.productImage19,
//       description:
//           'This is a Product description for Nike Air Jordon. There are more things that can be added but i am just practicing and nothing else.',
//       brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike'),
//       images: [TImages.productImage19, TImages.productImage20, TImages.productImage21, TImages.productImage22],
//       salePrice: 200,
//       sku: 'ABR4568',
//       categoryId: '8',
//       productAttributes: [
//         ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
//         ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
//       ],
//       productType: 'ProductType.single',
//     ),
//   ];
// }
