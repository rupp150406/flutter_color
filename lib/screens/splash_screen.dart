import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/asset_gen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Image.asset(AppImages.splash, width: 150),
      ),
    );
  }
}
