import 'package:flutter/material.dart';
import 'package:flutter_t_store/features/authentication/views/onboarding/onboarding_screen.dart';
import 'package:flutter_t_store/utils/constants/text_strings.dart';
import 'package:flutter_t_store/utils/theme/theme.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: UtTexts.appName,
      themeMode: ThemeMode.system,
      theme: UtAppTheme.lightTheme,
      darkTheme: UtAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      // initialBinding: GeneralBindings(),
      home: const OnBoardingScreen(),
    );
  }
}
