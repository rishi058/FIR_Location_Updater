import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/app_colors.dart';
import '../../../common/constants.dart';
import '../controllers/form_controller.dart';
import 'date_picker.dart';

class SnahForm extends StatelessWidget {
  const SnahForm({super.key});

  @override
  Widget build(BuildContext context) {
    FirData firData = Get.find();
    return Column(children: [
      Row(
        children: [
          const Flexible(
            flex: 3,
            child: Text(
              'SNAH Number: ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Flexible(
              flex: 7,
              child: Container(
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
                    hintText: 'SNAH Number...',
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding * 2,
                      vertical: verticalPadding,
                    ),
                    border: InputBorder.none,
                  ),
                  onChanged: (newValue) {
                    firData.snahNumber = newValue;
                  },
                ),
              )),
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      const Row(
        children: [
          Flexible(
            flex: 3,
            child: Text(
              'Date : ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          SizedBox(
            height: 10,
          ),
          MyDatePicker(),
        ],
      ),
    ]);
  }
}
