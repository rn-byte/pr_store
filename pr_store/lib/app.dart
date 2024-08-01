import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_store/features/authentication/screens/onboarding.dart';
import 'utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      title: 'PR-Store',
      theme: PrAppTheme.lightTheme,
      darkTheme: PrAppTheme.darkTheme,
      home: const OnboardingScreen(),
    );
  }
}
