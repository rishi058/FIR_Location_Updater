import 'package:flutter/material.dart';
import '../../../common/app_assets.dart';

Widget logo() {
  return SizedBox(
    height: 150,
    child: Center(
      child: Image.asset(
        AppAssets.logo,
        fit: BoxFit.cover,
        height: 100,
      ),
    ),
  );
}
