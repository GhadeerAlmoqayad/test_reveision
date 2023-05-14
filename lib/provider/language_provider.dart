import 'package:flutter/material.dart';

import '../prefs/shared_pref_controller.dart';

class LanguageProvider extends ChangeNotifier {
  String language = SharedPrefController().getValueFor<String>(PrefKeys.language.name) ?? 'en';

  void changeLanguage() {
    language = language == 'en' ? 'ar' : 'en';
    SharedPrefController().changeLanguage(langCode: language);
    notifyListeners();
  }
}
//
//
// class LanguageProvider extends ChangeNotifier {
// String _languageCode = 'en';
//
// String get languageCode => _languageCode;
//
// void changeLanguage(String langCode) {
//   _languageCode = langCode;
//   notifyListeners();
// }
//}