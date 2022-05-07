import 'package:docsify/config/constant.dart';
import 'package:docsify/data/model/user_model.dart';
import 'package:docsify/services/globals.dart' as globals;
import 'package:docsify/utils/log_utils.dart';
import 'package:get_storage/get_storage.dart';

class StorageUtils {
  static Future<void> saveUser(UserResponse ob) async {
    globals.accessToken = ob.token;
    globals.accountId = ob.userId.toString();
    await GetStorage().write(StorageKey.AccountInfo, ob.toJson());
  }

  static Future<UserResponse?> getUser() async {
    try {
      var userString = await GetStorage().read(StorageKey.AccountInfo);
      var result = UserResponse.fromJson(userString);
      globals.accessToken = result.token;
      globals.accountId = result.userId.toString();
      return result;
    } catch (ex) {
      return null;
    }
  }
}
