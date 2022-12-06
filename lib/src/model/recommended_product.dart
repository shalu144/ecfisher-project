
import 'package:flutter/material.dart';

import '../../core/app_color.dart';

class RecommendedProduct {
  Color? cardBackgroundColor;
  Color? buttonTextColor;
  Color? buttonBackgroundColor;
  String? imagePath;

  RecommendedProduct(
      {this.cardBackgroundColor,
      this.buttonTextColor = AppColor.theme,
      this.buttonBackgroundColor = Colors.white,
      this.imagePath});
}
