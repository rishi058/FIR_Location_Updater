import 'package:flutter/material.dart';
import 'package:police/controllers/user_data_instance.dart';
import 'package:police/views/dashboard/widgets/year_picker.dart';

import '../../../common/app_colors.dart';
import '../../../common/constants.dart';
import 'package:get/get.dart';

import '../controllers/form_controller.dart';
import 'fir_type.dart';

class FirForm extends StatefulWidget {
  const FirForm({super.key});

  @override
  State<FirForm> createState() => _FirFormState();
}

class _FirFormState extends State<FirForm> {
  UserController user = Get.find();
  FirData firData = Get.find();
  @override
  Widget build(BuildContext context) {
    // String hintText = 'Year';
    return Column(children: [
      const SizedBox(
        height: 10,
      ),
      Row(
        children: [
          const Flexible(
            flex: 3,
            child: Text(
              'Police Station : ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Flexible(
              flex: 7,
              child: Text(user.policeStation.value,  style: const TextStyle(fontWeight: FontWeight.bold),)),
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        children: [
          const Flexible(
            flex: 3,
            child: Text(
              'FIR Number : ',
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
                    hintText: 'FIR Number...',
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding * 2,
                      vertical: verticalPadding,
                    ),
                    border: InputBorder.none,
                  ),
                  onChanged: (newValue) {
                    firData.firNumber = newValue;
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
              'Year : ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          YearSelector(),
        ],
      ),
      const FirType(),
    ]);
  }
}
