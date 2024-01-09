import 'package:get_storage/get_storage.dart';

String getAuthToken() {
  return GetStorage().read('authToken') ?? "";
}

void setAuthToken(String token) {
  GetStorage().write("authToken", token);
}