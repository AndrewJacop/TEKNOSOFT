import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_t_store/data/repositories/user/user_repository.dart';
import 'package:flutter_t_store/features/authentication/models/user_model.dart';
import 'package:flutter_t_store/features/authentication/views/login/login_screen.dart';
import 'package:flutter_t_store/features/personalization/views/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:flutter_t_store/utils/constants/image_strings.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/helpers/network_manager.dart';
import 'package:flutter_t_store/utils/popups/full_screen_loader.dart';
import 'package:flutter_t_store/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  /// Variables
  final profileLoading = false.obs;
  final imageUploading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());

  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final passwordHidden = false.obs;

  @override
  void onInit() {
    fetchUserRecord();
    super.onInit();
  }

  /// Fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final currentUserData = await userRepository.fetchUserDetails();
      user(currentUserData);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// Save user Record from any Registeration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      // First Update Rx User and then check if user data is already stored. If not store new data
      await fetchUserRecord();

      // If no record at readv stored.
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          // Convert Name to First and Last Name
          final nameParts = UserModel.nameparts(userCredential.user!.displayName ?? '');
          final username = UserModel.genrateUserName(userCredential.user!.displayName ?? '');

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
      }
    } catch (e) {
      UtLoaders.warningSnackBar(
        title: 'Data not saved',
        message: 'Something went wrong white saving your information. You can re-save your data in your Profile.',
      );
    }
  }

  /// Delete Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(UtSizes.md),
      title: 'Delete Account',
      middleText:
          'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
      confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red, side: const BorderSide(color: Colors.red)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: UtSizes.lg),
            child: Text('Delete'),
          )),
      cancel: OutlinedButton(onPressed: () => Navigator.of(Get.overlayContext!).pop(), child: const Text('Cancel')),
    );
  }

  /// Delete User Account
  void deleteUserAccount() async {
    try {
      UtFullScreenLoader.openLoadingDialog('Processing...', UtImages.docerAnimation);

      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        // Re-Verifiy Auth Email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          UtFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          UtFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthenticateLoginScreen());
        }
      }
    } catch (e) {
      UtFullScreenLoader.stopLoading();
      UtLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Re-Authenticate before deleteing
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      UtFullScreenLoader.openLoadingDialog('Processing...', UtImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        UtFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!reAuthFormKey.currentState!.validate()) {
        // Remove Loader
        UtFullScreenLoader.stopLoading();
        return;
      }

      // Re-Auth then Delete
      await AuthenticationRepository.instance
          .reAuthenticateEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();

      UtFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      UtFullScreenLoader.stopLoading();
      UtLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Upload user profile Image
  Future<void> uploadUserProfilePicture() async {
    try {
      imageUploading.value = true;
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxHeight: 512,
        maxWidth: 512,
        imageQuality: 70,
      );

      if (image != null) {
        // Upload image
        final imageUrl = await userRepository.uploadImage('Users/Images/Profile/', image);
        // Update User Image Record in database
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);
        // Update local user record
        user.value.profilePicture = imageUrl;
        user.refresh();

        // Success Snack Bar
        UtLoaders.successSnackBar(
          title: 'Congratulations!',
          message: 'Your Profile Picture has been Updated Successfully',
        );
      }
    } catch (e) {
      UtLoaders.errorSnackBar(title: 'Oh Snap!', message: "Something went wrong: $e");
    } finally {
      imageUploading.value = false;
    }
  }
}
