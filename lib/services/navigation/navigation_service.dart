import 'package:get/get.dart';

class NavigationService {
  static final NavigationService _instance = NavigationService._internal();
  factory NavigationService() => _instance;
  NavigationService._internal();

  // push named route
  Future<dynamic>? navigateTo(String routeName, {dynamic arguments}) {
    return Get.toNamed(routeName, arguments: arguments);
  }

  // push named route and remove all previous routes in the stack
  Future<dynamic>? replace(String routeName, {dynamic arguments}) {
    return Get.offNamed(routeName, arguments: arguments);
  }

  Future<dynamic>? replaceAll(String routeName, {dynamic arguments}) {
    return Get.offAllNamed(routeName, arguments: arguments);
  }

  // pop route
  void goBack() {
    Get.back();
  }
}
