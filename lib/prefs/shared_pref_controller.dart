import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys { language, id, name, email, loggedIn }

class SharedPrefController {
  SharedPrefController._();

  late SharedPreferences _sharedPreferences;

  static SharedPrefController? _instance;

  factory SharedPrefController() {
    return _instance ??= SharedPrefController._();
  }

  Future<void> initPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  // void save({required User user}) {
  //   _sharedPreferences.setBool(PrefKeys.loggedIn.name, true);
  //   _sharedPreferences.setInt(PrefKeys.id.name, user.id);
  //   _sharedPreferences.setString(PrefKeys.name.name, user.name);
  //   _sharedPreferences.setString(PrefKeys.email.name, user.email);
  // }

  void changeLanguage({required String langCode}) {
    _sharedPreferences.setString(PrefKeys.language.name, langCode);
  }

  T? getValueFor<T>(String key) {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.get(key) as T;
    }
    return null;
  }

  Future<bool> removeValueFor(String key) async {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.remove(key);
    }
    return false;
  }

  Future<bool> clear() {
    return _sharedPreferences.clear();
  }

String get language =>
    _sharedPreferences.getString(PrefKeys.language.name) ?? 'en';
//
// bool get loggedIn =>
//     _sharedPreferences.getBool(PrefKeys.loggedIn.name) ?? false;
}