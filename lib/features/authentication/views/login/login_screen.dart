import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/styles/spacing_styles.dart';
import 'package:flutter_t_store/common/widgets/auth/form_divider.dart';
import 'package:flutter_t_store/common/widgets/auth/social_buttons.dart';
import 'package:flutter_t_store/features/authentication/views/login/widgets/login_form.dart';
import 'package:flutter_t_store/features/authentication/views/login/widgets/login_header.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: UtSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header : Logo, title & subtitle
              LoginHeader(),

              /// Form :
              LoginForm(),

              /// Devider :
              FormDivider(dividerText: UtTexts.orSignInWith),
              SizedBox(height: UtSizes.spaceBtwSections),

              /// Footer :
              SocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
