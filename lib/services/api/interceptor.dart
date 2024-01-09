import 'package:dio/dio.dart' ;
import 'package:get/get.dart' as get_;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../common/local_data_storage.dart';
import '../log/logger_service.dart';
import '../navigation/navigation_service.dart';

class AppInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // adding base URL:
    options.baseUrl = dotenv.get('BASE_URL');

    // Adding headers on requests:
    options.headers.addAll({"Cookie": getAuthToken()});

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppLogger.printLog(err.toString());
    // Getting the error message from response:

    // If the user receives 401 error, log the user out.
    if (err.response?.statusCode == 401) {
      // logging user out and redirecting to login screen:
      NavigationService().replaceAll('/login-screen');
      setAuthToken("");
      get_.Get.snackbar("Error!", "Try to Sign In again!");
    } else if (err.response?.statusCode == 404) {
      // If the page is not found, go to page not found screen.
      AppLogger.printLog("Page Not Found");
      get_.Get.snackbar("Error!", "Page Not Found");
    } else {
      String errorMessage = err.response?.data["message"] ?? "Undefined Error!";
      // Covers all the other cases like
      // 403: When User doesn't have authorization to read/write some data, etc.
      get_.Get.snackbar("Error!", errorMessage);
    }
    return handler.next(err); //continue
  }
}