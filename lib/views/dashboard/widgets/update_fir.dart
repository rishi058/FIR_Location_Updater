import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:police/views/dashboard/widgets/snahnumber_entry.dart';

import '../../../common/app_colors.dart';
import '../../../common/constants.dart';
import '../controllers/form_controller.dart';
import 'firnumber_entry.dart';
// import 'package:get/get.dart';

class UpdateFir extends StatefulWidget {
  const UpdateFir({super.key});

  @override
  State<UpdateFir> createState() => _UpdateFirState();
}

bool firform = true;
bool snahform = false;

class _UpdateFirState extends State<UpdateFir> {
  FirData firData = Get.find();
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
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: AppColors.greyShadowColor,
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: horizontalPadding * 2,
            vertical: verticalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Update FIR with Location',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Row(children: [
                Expanded(
                  child: GestureDetector(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: AppColors.violetSecondaryColor,
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(10, 10))),
                      height: 50,
                      width: 150,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          firform == false
                              ? const Icon(Icons.radio_button_off_outlined)
                              : const Icon(
                                  Icons.radio_button_checked,
                                  color: AppColors.blueSecondaryColor,
                                ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text(
                            'FIR स०',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        firform = true;
                        snahform = false;
                      });
                      firData.isSnah = false;
                    },
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: GestureDetector(
                    child: Container(
                      height: 50,
                      width: 165,
                      decoration: const BoxDecoration(
                          color: AppColors.greenSecondaryColor,
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(10, 10))),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          snahform == false
                              ? const Icon(Icons.radio_button_off_outlined)
                              : const Icon(
                                  Icons.radio_button_checked,
                                  color: AppColors.blueSecondaryColor,
                                ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text(
                            'सनाह स०',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        firform = false;
                        snahform = true;
                      });
                      firData.isSnah = true;
                    },
                  ),
                ),
              ]),
              const SizedBox(
                height: 8,
              ),
              firform == true ? const FirForm() : const SnahForm(),
            ],
          ),
        ),
      ),
    );
  }
}
