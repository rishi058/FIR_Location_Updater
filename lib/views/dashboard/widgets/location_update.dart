import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../../common/app_colors.dart';
import '../../../common/constants.dart';
import '../../../services/log/logger_service.dart';
import '../controllers/form_controller.dart';

class LocationUpdate extends StatefulWidget {
  const LocationUpdate({super.key});

  @override
  State<LocationUpdate> createState() => _LocationUpdateState();
}

class _LocationUpdateState extends State<LocationUpdate> {
  TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();
  bool isLoading = false;
  FirData firData = Get.find();

  @override
  void dispose() {
    latitudeController.dispose();
    longitudeController.dispose();
    super.dispose();
  }

  Future<void> _getLocation() async {
    setState(() {
      isLoading = true;
    });
    bool serviceEnabled = false;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      AppLogger.printLog('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        AppLogger.printLog('Location permissions are denied');
        setState(() {
          isLoading = false;
        });
        return;
      }
      if (permission == LocationPermission.deniedForever) {
        AppLogger.printLog(
            'Location permissions are permanently denied, we cannot request permissions.');
        setState(() {
          isLoading = false;
        });
        return;
      }
    }
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );
    setState(() {
      latitudeController.text = position.latitude.toString();
      longitudeController.text = position.longitude.toString();
      firData.latitude = position.latitude.toString();
      firData.longitude = position.longitude.toString();
      isLoading = false;
    });
  }

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Attach Current Location',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: const BoxDecoration(
                // color: AppColors.markLocationBannerColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(4),
                  bottomRight: Radius.circular(4),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    latitudeController.text == ""
                        ? const Icon(Icons.radio_button_off_outlined)
                        : const Icon(
                            Icons.radio_button_checked,
                            color: AppColors.blueSecondaryColor,
                          ),
                    const SizedBox(
                      width: 8,
                    ),
                    latitudeController.text == ""
                        ? const Text('Location Unmarked')
                        : const Text('Location marked')
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: horizontalPadding * 2,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: longitudeController,
                      enabled: false,
                      decoration: InputDecoration(
                        hintText: longitudeController.text == ''
                            ? 'Longitude'
                            : longitudeController.text,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      controller: latitudeController,
                      enabled: false,
                      decoration: InputDecoration(
                        hintText: latitudeController.text == ''
                            ? 'Latitude'
                            : latitudeController.text,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            isLoading
                ? const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Center(
                        child: CircularProgressIndicator(
                      color: AppColors.blueSecondaryColor,
                    )),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed:(){
                          FocusManager.instance.primaryFocus?.unfocus();
                          _getLocation();
                          },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.blueSecondaryColor,
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text(
                          'Attach with Cases',
                          style: TextStyle(
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
