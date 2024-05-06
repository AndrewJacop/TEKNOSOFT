import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_t_store/features/authentication/models/user_model.dart';
import 'package:flutter_t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:flutter_t_store/utils/exceptions/format_exceptions.dart';
import 'package:flutter_t_store/utils/exceptions/platform_exceptions.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Function to Store User Data to Firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      return await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw UtFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const UtFormatException();
    } on PlatformException catch (e) {
      throw UtPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Function to fetch user details based on user id
  // Future<UserModel> fetchUserDetails() async {
  //   try {
  //     final documentSnapshot = await _db
  //         .collection("Users")
  //         .doc(AuthenticationRepository.instance.authUser?.uid)
  //         .get();
  //     if (documentSnapshot.exists) {
  //       return UserModel.fromSnapshot(documentSnapshot);
  //     } else {
  //       return UserModel.empty();
  //     }
  //   } on FirebaseException catch (e) {
  //     throw UtFirebaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const UtFormatException();
  //   } on PlatformException catch (e) {
  //     throw UtPlatformException(e.code).message;
  //   } catch (e) {
  //     throw 'Something went wrong. Please try again';
  //   }
  // }

  // Function to Update user details in Firestore
  // Future<void> updateUserDetails(UserModel updatedUser) async {
  //   try {
  //     await _db
  //         .collection("Users")
  //         .doc(updatedUser.id)
  //         .update(updatedUser.toJson());
  //   } on FirebaseException catch (e) {
  //     throw UtFirebaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const UtFormatException();
  //   } on PlatformException catch (e) {
  //     throw UtPlatformException(e.code).message;
  //   } catch (e) {
  //     throw 'Something went wrong. Please try again';
  //   }
  // }

  // Function to Update a specific field
  // Future<void> updateSingleField(Map<String, dynamic> json) async {
  //   try {
  //     await _db
  //         .collection("Users")
  //         .doc(AuthenticationRepository.instance.authUser?.uid)
  //         .update(json);
  //   } on FirebaseException catch (e) {
  //     throw UtFirebaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const UtFormatException();
  //   } on PlatformException catch (e) {
  //     throw UtPlatformException(e.code).message;
  //   } catch (e) {
  //     throw 'Something went wrong. Please try again';
  //   }
  // }

  // Function to remove the user data from firestore
  // Future<void> removeUserRecord(String userId) async {
  //   try {
  //     await _db.collection("Users").doc(userId).delete();
  //   } on FirebaseException catch (e) {
  //     throw UtFirebaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const UtFormatException();
  //   } on PlatformException catch (e) {
  //     throw UtPlatformException(e.code).message;
  //   } catch (e) {
  //     throw 'Something went wrong. Please try again';
  //   }
  // }

  // Upload Any Image
  // Future<String> uploadImage(String path, XFile image) async {
  //   try {
  //     final ref = FirebaseStorage.instance.ref(path).child(image.name);
  //     await ref.putFile(File(image.path));
  //     final url = await ref.getDownloadURL();
  //     return url;
  //   } on FirebaseException catch (e) {
  //     throw UtFirebaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const UtFormatException();
  //   } on PlatformException catch (e) {
  //     throw UtPlatformException(e.code).message;
  //   } catch (e) {
  //     throw 'Something went wrong. Please try again';
  //   }
  // }
}
