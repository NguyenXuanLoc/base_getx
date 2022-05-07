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

  Future<ApiResult> facebookSignIn(String token) async {
    var body = {
      ApiKey.token: token,
      ApiKey.device_id: globals.deviceId,
      ApiKey.device_name: globals.deviceName,
      ApiKey.device_model: globals.deviceModel
    };
    return await POST('auth/login_by_facebook', body);
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

  Future<ApiResult> forgotPass(String email) {
    var body = {ApiKey.email: email, ApiKey.role: ApiKey.user};
    return POST('auth/forgot_password', body);
  }

  Future<ApiResult> registerByEmail(String email, String userName, String pass,
      {String role = ApiKey.user}) {
    var body = {
      ApiKey.email: email,
      ApiKey.user_name: userName,
      ApiKey.password: pass,
      ApiKey.role: role
    };
    return POST('auth/register', body);
  }

  Future<ApiResult> createUserProfile(
      int accountId, String fullName, String birthDate, String phone) async {
    var body = {
      ApiKey.account_id: accountId,
      ApiKey.full_name: fullName,
      ApiKey.gender: '',
      ApiKey.birth_date: birthDate,
      ApiKey.phone: phone,
      ApiKey.description: '',
      ApiKey.house_number: '',
      ApiKey.street: '',
      ApiKey.zip_code: '',
      ApiKey.place: ''
    };
    return await POST('kuser/profiles/', body);
  }

  Future<ApiResult> sentActiveEmail(String email) async {
    return await POST("auth/send_active_email/$email", null);
  }

  Future<ApiResult> resentActiveEmail(String email) async {
    var body = {ApiKey.email: email};
    return await POST('auth/resend_activate_mail', body);
  }

  Future<ApiResult> activeCode(String code) async {
    var body = {ApiKey.code: code};
    return await POST('auth/active/code', body);
  }
}
