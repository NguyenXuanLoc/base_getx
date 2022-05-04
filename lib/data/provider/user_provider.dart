import 'package:docsify/config/constant.dart';
import 'package:docsify/data/provider/api_result.dart';
import 'package:docsify/data/provider/base_provider.dart';
import 'package:docsify/services/globals.dart' as globals;

class UserProvider extends BaseProvider {
  static final UserProvider instance = UserProvider._internal();

  factory UserProvider() => instance;

  UserProvider._internal() {
    initProvider();
  }

  Future<ApiResult> googleSignIn(String token) async {
    var body = {
      ApiKey.token: token,
      ApiKey.device_id: globals.deviceId,
      ApiKey.device_name: globals.deviceName,
      ApiKey.device_model: globals.deviceModel,
    };
    return await POST('auth/login_by_google', body);
  }

  Future<ApiResult> login(String email, String pass,
      {String loginAs = 'provider'}) async {
    var body = {
      ApiKey.email: email,
      ApiKey.password: pass,
      ApiKey.device_id: globals.deviceId,
      ApiKey.device_name: globals.deviceName,
      ApiKey.device_model: globals.deviceModel,
      ApiKey.login_as: loginAs
    };
    return await POST('auth/login', body);
  }
}
