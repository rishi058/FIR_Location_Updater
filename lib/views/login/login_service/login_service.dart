import 'package:get/get.dart';
import '../../../common/local_data_storage.dart';
import '../../../controllers/user_data_instance.dart';
import '../../../services/api/dio_api_service.dart';
import '../../../services/log/logger_service.dart';

Future<String> login(String username, String password) async {
  var myData = {"username": username, "password": password};
  UserController user = Get.find();
  try {
    var response = await getDio().post("auth/login/", data: myData);
    if (response.statusCode == 200) {
      user.setUserFromJson(response.data["user"]);
      AppLogger.printLog(response.data["token"]);
      setAuthToken(response.data["token"]);
      user.printUserData();
      return "";
    } else {
      AppLogger.printLog(response.data["message"]);
      return response.data["message"];
    }
  } catch (e) {
    AppLogger.printLog(e.toString());
  }

  return "Some Error Occurred!";
}
