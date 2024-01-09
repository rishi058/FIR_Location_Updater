import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/app_colors.dart';
import '../controllers/form_controller.dart';

class MyDatePicker extends StatefulWidget {
  const MyDatePicker({super.key});

  @override
  State<MyDatePicker> createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  FirData firData = Get.find();
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      firData.date = _selectedDate.toString();
    }
  }

  @override
  void initState() {
    firData.date = _selectedDate.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          "${_selectedDate.toLocal()}".split(' ')[0],
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 25,
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(AppColors.blueSecondaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          onPressed: (){
            FocusManager.instance.primaryFocus?.unfocus();
            _selectDate(context);
            },
          child: const Text(
            'Select date',
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
