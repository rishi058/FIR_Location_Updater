import 'package:flutter/material.dart';
import 'package:police/common/app_assets.dart';
import '../../../common/app_colors.dart';
import '../../../common/constants.dart';
import '../../../common/local_data_storage.dart';
import '../../../services/navigation/navigation_service.dart';
import 'logout_dialog.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      type: MaterialType.canvas,
      child: Container(
        color: AppColors.whiteColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: Image.asset(
              AppAssets.icon,
              fit: BoxFit.fill,
              height: 50,
            ),
            title: const Text(
              'LOCUS',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                showLogoutBox(context).then((value){
                  if(value){
                    setAuthToken("");
                    NavigationService().replaceAll('/login-screen');
                  }
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
