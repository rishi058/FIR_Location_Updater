import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';

Widget showLoading(){
  return const Center(
    child: CircularProgressIndicator(color: AppColors.redSecondaryColor),
  );
}