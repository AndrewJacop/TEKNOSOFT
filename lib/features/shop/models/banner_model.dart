import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String imageUrl;
  String targetScreen;
  bool active;

  /// Constructor
  BannerModel({required this.imageUrl, required this.targetScreen, required this.active});

  /// Empty Helper Function
  static BannerModel empty() => BannerModel(active: false, imageUrl: '', targetScreen: '');

  /// Convert model to json structure
  Map<String, dynamic> toJson() {
    return {
      'ImageUrl': imageUrl,
      'TargetScreen': targetScreen,
      'Active': active,
    };
  }

  /// Map Json Oriented document snapshot from Firebase to CategrotyModel
  factory BannerModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      return BannerModel(
        imageUrl: data['ImageUrl'] ?? '',
        targetScreen: data['TargetScreen'] ?? '',
        active: data['Active'] ?? false,
      );
    } else {
      return BannerModel.empty();
    }
  }
}
