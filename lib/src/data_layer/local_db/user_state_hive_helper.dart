import 'package:hive/hive.dart';
import 'package:green_spark_vendor/src/data_layer/local_db/hive_database_helper.dart';

/// Helper class to save user information locally on the device
class UserStateHiveHelper {
  UserStateHiveHelper.__internal();

  static final UserStateHiveHelper _instance = UserStateHiveHelper.__internal();

  static UserStateHiveHelper get instance => _instance;

  /// Method used to open user box [Boxes.userBox]
  /// Box is opened only when hive is initialized
  /// Hive already initialized in [main.dart] file
  /// inside main method before [runApp] method is called
  Future<Box<dynamic>> _openHiveBox() async {
    try {
      return await Hive.openBox(Boxes.userBox
          // encryptionCipher:
          //     HiveAesCipher(SecureStorageHelper.instance.decodedKey),
          );
    } catch (e) {
      /// If hive db gives some error then it is initialized and open again
      /// and generate again encryption key for encrypted hive box
      await HiveHelper.initializeHiveAndRegisterAdapters();
      // await SecureStorageHelper.instance.generateEncryptionKey();
      return await Hive.openBox(Boxes.userBox
          // encryptionCipher:
          //     HiveAesCipher(SecureStorageHelper.instance.decodedKey),
          );
    }
  }

  void close() {
    Hive.openBox(Boxes.userBox).then((box) {
      box.close();
    });
  }

  Future<void> logIn() async {
    await _openHiveBox();
    Hive.box(Boxes.userBox).put(Boxes.loggedIn, true);
  }

  Future<void> logOut() async {
    await _openHiveBox();
    Hive.box(Boxes.userBox).put(Boxes.loggedIn, false);
  }

  Future<bool> isLoggedIn() async {
    await _openHiveBox();
    final loggedIn = Hive.box(Boxes.userBox).get(Boxes.loggedIn);
    return loggedIn ?? false;
  }

  Future<void> deleteUser() async {
    // await _openHiveBox();
    Hive.box(Boxes.userBox).delete(Boxes.userBox);

    Hive.box(Boxes.userBox).deleteFromDisk();
    return;
  }

  Future<void> setUserName(String? userName) async {
    await _openHiveBox();
    Hive.box(Boxes.userBox).put(Boxes.userBox, userName);
  }

  Future<String> getUserName() async {
    await _openHiveBox();
    final userName = Hive.box(Boxes.userBox).get(Boxes.userBox);
    return userName;
  }

  Future<void> setAccessToken(String accessToken) async {
    await _openHiveBox();
    Hive.box(Boxes.userBox).put(Boxes.accessToken, accessToken);
  }

  Future<void> setShowOnboard(bool flag) async {
    await _openHiveBox();
    Hive.box(Boxes.userBox).put(Boxes.showOnboard, flag);
  }

  Future<void> setRefreshToken(String refreshToken) async {
    await _openHiveBox();
    Hive.box(Boxes.userBox).put(Boxes.refreshToken, refreshToken);
  }

  Future<String> getRefreshToken() async {
    await _openHiveBox();
    final refreshToken = Hive.box(Boxes.userBox).get(Boxes.refreshToken);
    return refreshToken ?? "";
  }

  Future<String?> getShowOnboard() async {
    await _openHiveBox();
    final flag = Hive.box(Boxes.userBox).get(Boxes.showOnboard);
    return flag ?? false;
  }

  Future<String?> getAccessToken() async {
    await _openHiveBox();
    final accessToken = Hive.box(Boxes.userBox).get(Boxes.accessToken);
    return accessToken ?? "";
  }

  ///Saving the valur of [isGuestUSer]
  Future<void> setIsGuestUserValue(bool isGuest) async {
    await _openHiveBox();
    Hive.box(Boxes.userBox).put(Boxes.isGuestUSer, isGuest);
  }

  Future<bool?> getIsGuestUser() async {
    await _openHiveBox();
    final isGuestUSer = Hive.box(Boxes.userBox).get(Boxes.isGuestUSer);
    return isGuestUSer ?? false;
  }
}
