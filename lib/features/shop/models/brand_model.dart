import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

  BrandModel({required this.id, required this.name, required this.image, this.isFeatured, this.productsCount});

  /// Empty Helper Function
  static BrandModel empty() => BrandModel(id: "", name: "", image: "");

  /// Convert model to Json structure so that you can store data in Firebase
  toJson() {
    return {
      "Id": id,
      "Name": name,
      "Image": image,
      "IsFeatured": isFeatured,
      "ProductsCount": productsCount,
    };
  }

  /// Mop Json-oriented document snapshot Json to BrandModel
  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) {
      return BrandModel.empty();
    }
    return BrandModel(
        id: data["Id"] ?? "",
        name: data["Name"] ?? "",
        image: data["Image"] ?? "",
        isFeatured: data["IsFeatured"] ?? false,
        productsCount: int.parse((data["ProductsCount"] ?? 0).toString()));
  }

  /// Map Json-oriented document snapshot from Firebase Snapshop to Model
  factory BrandModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return BrandModel(
          id: document.id,
          name: data["Name"] ?? "",
          image: data["Image"] ?? "",
          isFeatured: data["IsFeatured"] ?? false,
          productsCount: data["ProductsCount"] ?? 0);
    } else {
      return BrandModel.empty();
    }
  }
}
