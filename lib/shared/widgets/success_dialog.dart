import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/app_colors.dart';
import '../../services/navigation/navigation_service.dart';

class SuccessDialog extends StatefulWidget {
  final String title;
  final String message;

  const SuccessDialog({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  State<SuccessDialog> createState() => _SuccessDialogState();
}

class _SuccessDialogState extends State<SuccessDialog> {
  NavigationService navigator = Get.find();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(20.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.check_circle_outline,
            color: AppColors.successColor,
            size: 60,
          ),
          const SizedBox(height: 20),
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(widget.message, textAlign: TextAlign.center),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              navigator.replaceAll('/dashboard');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.successColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: const Text(
              "OK",
              style: TextStyle(
                color: AppColors.textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
