import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/app_colors.dart';
import '../controllers/form_controller.dart';

class YearSelector extends StatefulWidget {
  const YearSelector({super.key});

  @override
  State<YearSelector> createState() => _YearSelectorState();
}

class _YearSelectorState extends State<YearSelector> {
  FirData firData = Get.find();
  int selectedYear = DateTime.now().year;

  @override
  void initState() {
    firData.year = selectedYear.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$selectedYear',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(
            width: 20,
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Year :'),
                    content: SizedBox(
                      width: double.minPositive,
                      height: 100,
                      child: ListView.builder(
                        itemCount: 100,
                        itemBuilder: (BuildContext context, int index) {
                          int year = selectedYear - index;
                          return ListTile(
                            title: Text(year.toString()),
                            onTap: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              setState(() {
                                selectedYear = year;
                              });
                              firData.year = year.toString();
                              Navigator.pop(context);
                            },
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  AppColors.blueSecondaryColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            child: const Text(
              'Select Year',
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
