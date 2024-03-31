import 'package:flutter/material.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/constants/text_strings.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: UtSizes.spaceBtwSections),
        child: Column(
          children: [
            /// EMAIL
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: UtTexts.email,
              ),
            ),
            const SizedBox(height: UtSizes.spaceBtwInputFields),

            /// PASSWORD
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.password_check),
                  labelText: UtTexts.password,
                  suffixIcon: Icon(Iconsax.eye_slash)),
            ),
            const SizedBox(height: UtSizes.spaceBtwInputFields / 2),

            /// Remember me & forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remeber Me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: ((value) {})),
                    const Text(UtTexts.rememberMe)
                  ],
                ),

                /// Forget Password
                TextButton(
                    onPressed: () {}, child: const Text(UtTexts.forgetPassword))
              ],
            ),
            const SizedBox(height: UtSizes.spaceBtwSections),

            /// Sign In Button
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                  onPressed: () {}, child: const Text(UtTexts.signIn)),
            ),
            const SizedBox(height: UtSizes.spaceBtwItems),

            /// Create Account Button
            SizedBox(
              width: double.maxFinite,
              child: OutlinedButton(
                  onPressed: () {}, child: const Text(UtTexts.createAccount)),
            ),
            const SizedBox(height: UtSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
