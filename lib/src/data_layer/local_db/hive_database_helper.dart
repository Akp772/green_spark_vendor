import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveHelper {
  static Future<bool> initializeHiveAndRegisterAdapters() async {
    /// Do not edit this method until you need a new adapter
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String dbFilePath = [appDocDir.path, 'foodSteps_data'].join('/');
      Hive.init(dbFilePath);

      /// For every model that needs to be saved locally, an adapter is generated
      /// These adapter need to be registered
      // Hive.registerAdapter(UserAdapter());
      return true;
    } catch (e) {
      return false;
    }
  }
}

class Boxes {
  static const String userBox = 'user_box';
  static const String loggedIn = 'logged_in';
  static const String accessToken = 'access_token';
  static const String showOnboard = 'show-onboard';
  static const String isGuestUSer = 'is_guest_user';
  static const String bgColor = 'bgColor';
  static const String refreshToken = 'refreshToken';
}

class HiveTypes {
  static const int user = 0;
}
