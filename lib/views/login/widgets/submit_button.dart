import 'package:flutter/material.dart';
import '../../../common/app_colors.dart';

Widget loginButton() {
  return Container(
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: AppColors.redSecondaryColor.withOpacity(0.85),
    ),
    child: const Center(
      child: Text(
        'Submit',
        style: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 20,
        ),
      ),
    ),
  );
}
