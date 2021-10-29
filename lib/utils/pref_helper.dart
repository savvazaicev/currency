import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  PrefHelper._init();

  static const String ENABLED_CURRENCY_ABBREVIATIONS =
      "enabled_currency_abbreviations";

  static Future<SharedPreferences> prefs() async =>
      SharedPreferences.getInstance();

  static setEnabledCurrencyAbbreviations(
      List<String> currencyAbbreviations) async {
    (await prefs())
        .setStringList(ENABLED_CURRENCY_ABBREVIATIONS, currencyAbbreviations);
  }

  static Future<List<String>> getEnabledCurrencyAbbreviations() async =>
      (await prefs()).getStringList(ENABLED_CURRENCY_ABBREVIATIONS) ?? [];
}
