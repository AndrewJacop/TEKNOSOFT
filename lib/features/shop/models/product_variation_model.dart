// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductVariationModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributeValues;

  /// Constructor
  ProductVariationModel({
    required this.id,
    this.sku = "",
    this.image = "",
    this.description = "",
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stock = 0,
    required this.attributeValues,
  });

  /// Empty Helper Function
  static ProductVariationModel empty() => ProductVariationModel(id: "", attributeValues: {});

  /// Convert model to Json structure so that you can store data in Firebase
  toJson() {
    return {
      'Id': id,
      'SKU': sku,
      'Image': image,
      'Description': description,
      'Price': price,
      'SalePrice': salePrice,
      'Stock': stock,
      'AttributeValues': attributeValues,
    };
  }

  /// Map Json oriented document snapshot from Firebase Snapshop to Model
  factory ProductVariationModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) {
      return ProductVariationModel.empty();
    }

    return ProductVariationModel(
      id: data['Id'] ?? "",
      sku: data['SKU'] ?? "",
      image: data['Image'] ?? "",
      description: data['Description'] ?? "",
      price: double.parse((data['Price'] ?? 0.0).toString()),
      salePrice: double.parse((data['SalesPrice'] ?? 0.0).toString()),
      stock: data['Stock'] ?? 0,
      attributeValues: Map<String, String>.from((data['AttributeValues'])),
    );
  }
}
