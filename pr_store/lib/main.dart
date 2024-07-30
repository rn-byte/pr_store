import 'package:flutter/material.dart';
import 'package:pr_store/utils/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
