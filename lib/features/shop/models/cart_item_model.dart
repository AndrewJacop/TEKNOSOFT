class CartItemModel {
  String productId;
  String title;
  double price;
  String? image;
  int quantity;
  String variationId;
  String? brandName;
  Map<String, String>? selectedVariation;

  /// Constructor
  CartItemModel({
    required this.productId,
    required this.quantity,
    this.variationId = "",
    this.image,
    this.price = 0.0,
    this.title = "",
    this.brandName,
    this.selectedVariation,
  });

  /// Empty Cart
  static CartItemModel empty() => CartItemModel(productId: "", quantity: 0);

  /// Convert a Cart Item to a JSON Map
  Map<String, dynamic> toJson() {
    return {
      "productId": productId,
      "title": title,
      "price": price,
      "image": image,
      "quantity": quantity,
      "variationId": variationId,
      "brandName": brandName,
      "selectedVariation": selectedVariation
    };
  }

  /// Create CartItem from a JSON Map
  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
        productId: json['productId'] as String,
        title: json['title'] as String,
        price: json['price']?.toDouble(),
        image: json['image'],
        quantity: json['quantity'] as int,
        variationId: json['variationId'] as String,
        brandName: json['brandName'],
        selectedVariation:
            json["selectedVariation"] != null ? Map<String, String>.from(json["selectedVariation"]) : null);
  }
}
