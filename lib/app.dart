import 'package:flutter/material.dart';
import 'package:flutter_t_store/bindings/general_bindings.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/text_strings.dart';
import 'package:flutter_t_store/utils/theme/theme.dart';
import 'package:get/get.dart';

/// -- Use this Class to setup themes, initial Bindings, any animations and much more using Material Widget.
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
      initialBinding: GeneralBindings(),

      /// Show Loader or Circular Progress Indicator meanwhite Authentication Repository is deciding to show relevant screen.
      home: const Scaffold(
        backgroundColor: UtColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
