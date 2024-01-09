import 'package:get/get.dart';
import 'package:police/views/dashboard/bindings/dashboard_bindings.dart';
import 'package:police/views/dashboard/screens/dashboard.dart';
import 'package:police/views/login/login_screen.dart';

final getPages = [
  GetPage(
    name: "/dashboard",
    page: () => const DashBoardPage(),
    binding: DashBoardBindings(),
  ),
  GetPage(
      name: "/login-screen",
      page: () => const LoginScreen()
  ),
];
