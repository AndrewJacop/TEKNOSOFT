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
