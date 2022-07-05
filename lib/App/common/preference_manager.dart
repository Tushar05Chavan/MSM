import 'package:get_storage/get_storage.dart';

class PreferenceManager {
  static GetStorage getStorage = GetStorage();

  static String emailID = "email_id";
  static String firstName = "firstName";
  static String lastName = "lastName";

  static String userId = "userId";
  static String token = "";

  ///email
  static Future setUserId(int value) async {
    await getStorage.write(userId, value);
  }

  static int getUserId() {
    return getStorage.read(userId);
  }

  ///email
  static Future setEmailId(String value) async {
    await getStorage.write(emailID, value);
  }

  static getEmailId() {
    return getStorage.read(emailID);
  }

  ///token
  static Future setToken(String value) async {
    await getStorage.write(token, value);
  }

  static getToken() {
    return getStorage.read(token);
  }

  ///first_name
  static Future setFirstName(String value) async {
    await getStorage.write(firstName, value);
  }

  static String getFirstName() {
    return getStorage.read(firstName);
  }

  ///last_name
  static Future setLastName(String value) async {
    await getStorage.write(lastName, value);
  }

  static String getLastName() {
    return getStorage.read(lastName);
  }
}
