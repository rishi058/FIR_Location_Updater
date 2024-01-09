import '../../../common/app_colors.dart';
import '../../../common/constants.dart';
import '/views/dashboard/widgets/final_submit.dart';
import '/views/dashboard/widgets/location_update.dart';
import '/views/dashboard/widgets/time.dart';
import '/views/dashboard/widgets/update_fir.dart';
import '/views/dashboard/widgets/appbar.dart';
import 'package:flutter/material.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            Appbar(),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      CalendarTimer(),
                      SizedBox(height: 15),
                      UpdateFir(),
                      SizedBox(height: 15),
                      LocationUpdate(),
                      SizedBox(height: 24),
                      //OtpBox(),
                      //SizedBox(height: 15),
                      FinalButton(),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
