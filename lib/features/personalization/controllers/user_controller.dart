import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_t_store/data/repositories/user/user_repository.dart';
import 'package:flutter_t_store/features/authentication/models/user_model.dart';
import 'package:flutter_t_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  /// Save user Record from any Registeration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        // Convert Name to First and Last Name
        final nameParts =
            UserModel.nameparts(userCredential.user!.displayName ?? '');
        final username =
            UserModel.genrateUserName(userCredential.user!.displayName ?? '');

        // Map data
        final user = UserModel(
          id: userCredential.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          username: username,
          email: userCredential.user!.email ?? '',
          phoneNumber: userCredential.user!.phoneNumber ?? '',
          profilePicture: userCredential.user!.photoURL ?? '',
        );

        // Save user data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      UtLoaders.warningSnackBar(
        title: 'Data not saved',
        message:
            'Something went wrong white saving your information. You can re-save your data in your Profile.',
      );
    }
  }
}
