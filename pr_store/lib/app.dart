import 'package:flutter/material.dart';
import 'utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      title: 'PR-Store',
      theme: PrAppTheme.lightTheme,
      darkTheme: PrAppTheme.darkTheme,
    );
  }
}
