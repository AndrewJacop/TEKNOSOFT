import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/auth/form_divider.dart';
import 'package:flutter_t_store/common/widgets/auth/social_buttons.dart';
import 'package:flutter_t_store/features/authentication/views/signup/widgets/signup_form.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(UtSizes.defaultSpace),
          child: Column(
            children: [
              /// Title
              Text(UtTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: UtSizes.spaceBtwSections),

              /// Form
              const SignupForm(),
              const SizedBox(height: UtSizes.spaceBtwSections),

              /// Divider
              const FormDivider(dividerText: UtTexts.orSignUpWith),
              const SizedBox(height: UtSizes.spaceBtwSections),

              /// Social Buttons
              const SocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
