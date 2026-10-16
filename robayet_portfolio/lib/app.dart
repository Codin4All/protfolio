import 'package:flutter/material.dart';
import 'data/portfolio_data.dart';
import 'screens/home_screen.dart';
import 'theme/app_theme.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '$ownerName | $ownerTitle',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: const HomeScreen(),
    );
  }
}
