import 'package:flutter/cupertino.dart';

class SettingsData extends ChangeNotifier {
  SettingsData(this._enabledCurrencies);

  List<String> _enabledCurrencies;

  List<String> get enabledCurrencies => List.unmodifiable(_enabledCurrencies);

  void updateEnabledCurrencies(List<String> enabledCurrencies) {
    _enabledCurrencies = enabledCurrencies;
    notifyListeners();
  }
}
