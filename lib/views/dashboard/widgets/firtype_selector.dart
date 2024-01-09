import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/app_colors.dart';
import '../controllers/form_controller.dart';

class FirTypeSelector extends StatefulWidget {
  const FirTypeSelector({super.key});

  @override
  State<FirTypeSelector> createState() => _FirTypeSelectorState();
}

class _FirTypeSelectorState extends State<FirTypeSelector> {
  FirData firData = Get.find();
  String selectedtype = 'NONE';
  @override
  Widget build(BuildContext context) {
    List<String> firs = [
      'लूट ',
      'डकैती ',
      'गृहभेदन ',
      'छिनतई - Chain',
      'छिनतई - Mobile',
      'छिनतई - Bag/Wallet/पैसा',
      'हत्या',
      'वाहन चोरी',
      'साम्प्रदायिक कांड',
    ];
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            child: Text(
              selectedtype,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  AppColors.blueSecondaryColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text(
                      'Fir Type :',
                    ),
                    content: SizedBox(
                      width: double.minPositive,
                      height: 200,
                      child: ListView.builder(
                        itemCount: firs.length,
                        itemBuilder: (BuildContext context, int index) {
                          String fir = firs[index];
                          return ListTile(
                            title: Text(fir),
                            onTap: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              setState(() {
                                selectedtype = fir;
                              });
                              firData.firType = fir;
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
            child: const Text(
              'Select Fir Type',
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 16,
              ),
              overflow: TextOverflow.fade,
            ),
          ),
        ],
      ),
    );
  }
}
