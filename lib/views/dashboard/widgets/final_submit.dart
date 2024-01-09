// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as api;
import 'package:police/common/constants.dart';
import 'package:police/controllers/user_data_instance.dart';

import '../../../common/app_colors.dart';
import '../../../services/api/dio_api_service.dart';
import '../../../services/log/logger_service.dart';
import '../../../shared/widgets/success_dialog.dart';
import '../controllers/form_controller.dart';

class FinalButton extends StatefulWidget {
  const FinalButton({super.key});

  @override
  State<FinalButton> createState() => _FinalButtonState();
}

class _FinalButtonState extends State<FinalButton> {
  FirData firData = Get.find();
  UserController user = Get.find();
  bool isLoading = false;

  void submitForm() async {
    if (!firData.isSnah) {
      // setState(() {
      //   isLoading = true;
      // });
      if (firData.firNumber == "" ||
          firData.latitude == "" ||
          firData.longitude == "" ||
          firData.firType == "" ||
          firData.year == "") {
        AppLogger.printLog("Please fill all the details",
            tag: "Submit error");
        Get.snackbar('Error', 'Please fill all the Details');
        // setState(() {
        //   isLoading = false;
        // });
        return;
      }

      var mydata = {
        "latitude": firData.latitude,
        "longitude": firData.longitude,
        "firNo": firData.firNumber,
        "year": firData.year,
        "firType": firData.firType,
        "ps" : user.policeStation.value,
      };

      // try {
      //   api.Response response = await getDio().post(
      //     "api/location/add-fir",
      //     data: mydata,
      //   );
      //   AppLogger.printLog(response, tag: "response");
      //   if (response.statusCode == 200) {
      //     showDialog(
      //       context: context,
      //       builder: (context) {
      //         return const SuccessDialog(
      //           message: "FIR Submitted successfully",
      //           title: "Success",
      //         );
      //       },
      //     );
      //   } else {
      //     AppLogger.printLog((response as Map<String, dynamic>)["message"],
      //         tag: "submit error");
      //   }
      // } catch (e) {
      //   AppLogger.printLog(e.toString(), tag: "submit error");
      // }
      // setState(() {
      //   isLoading = false;
      // });
      Get.snackbar('Success', 'Successfully Submitted');
    } else {
      // setState(() {
      //   isLoading = true;
      // });
      if (firData.snahNumber == "" ||
          firData.latitude == "" ||
          firData.longitude == "" ||
          firData.date == "") {
        AppLogger.printLog("Please fill all the details",
            tag: "Submit error");
        Get.snackbar('Error', 'Please fill all the Details');

        // setState(() {
        //   isLoading = false;
        // });
        return;
      }

      var myData =             {
        "latitude": firData.latitude,
        "longitude": firData.longitude,
        "snahNo": firData.snahNumber,
        "date": firData.date,
        "ps" : user.policeStation.value,
      };

      // try {
      //   api.Response response = await getDio().post(
      //       "api/location/add-snah",
      //       data: myData
      //   );
      //   AppLogger.printLog(response, tag: "response");
      //   if (response.statusCode == 200) {
      //     showDialog(
      //       context: context,
      //       builder: (context) {
      //         return const SuccessDialog(
      //           message: "FIR Submitted successfully",
      //           title: "Success",
      //         );
      //       },
      //     );
      //   } else {
      //     AppLogger.printLog((response as Map<String, dynamic>)["message"],
      //         tag: "submit error");
      //   }
      // } catch (e) {
      //   AppLogger.printLog(e.toString(), tag: "submit error");
      // }
      // setState(() {
      //   isLoading = false;
      // });
      Get.snackbar('Success', 'Successfully Submitted');
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const CircularProgressIndicator(
            color: AppColors.redSecondaryColor,
          )
        : Padding(
          padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.redSecondaryColor,
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Final Submit',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
        );
  }
}
