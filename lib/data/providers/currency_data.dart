import 'package:currency/data/currency/currency.dart';
import 'package:flutter/cupertino.dart';

class CurrencyData extends ChangeNotifier {
  CurrencyData(this._currencies);

  List<Currency> _currencies;

  List<Currency> get currencies => List.unmodifiable(_currencies);

  void updateCurrencies(List<Currency> currencies) {
    _currencies = currencies;
    notifyListeners();
  }
}
