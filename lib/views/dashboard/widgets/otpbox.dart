import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';
import '../../../common/constants.dart';

class OtpBox extends StatelessWidget {
  const OtpBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: horizontalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Enter OTP',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.greyBorderColor,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Enter OTP here...',
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding * 2,
                      vertical: verticalPadding,
                    ),
                    border: InputBorder.none,
                  ),
                  onChanged: (newValue) {
                    //
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
