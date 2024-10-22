import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_store/bindings/general_bindings.dart';
import 'package:pr_store/routes/app_routes.dart';
import 'package:pr_store/utils/constants/colors.dart';
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
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,

      ///Showing loader or progress indicator meanwhile Authentication Repository is deciding to show relevant screen
      home: const Scaffold(
        backgroundColor: PrColor.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: PrColor.white,
          ),
        ),
      ),
    );
  }
}
