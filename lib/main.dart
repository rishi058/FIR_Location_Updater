import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:police/routes.dart';
import 'package:police/services/log/logger_service.dart';
import 'package:police/services/navigation/navigation_service.dart';
import 'package:police/views/dashboard/controllers/form_controller.dart';

import 'controllers/user_data_instance.dart';

void main() async {
  if (kReleaseMode) {
    await dotenv.load(fileName: ".env.production");
  } else {
    await dotenv.load(fileName: ".env.staging");
  }
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  AppLogger.logEnable = true;
  AppLogger.printLog("App Started, Enjoy coding!!");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // injection dependencies...
    Get.put(UserController());
    Get.put(FirData());
    Get.put(NavigationService());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Case Management Dashboard',
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: "/dashboard",
      getPages: getPages,
    );
  }
}
