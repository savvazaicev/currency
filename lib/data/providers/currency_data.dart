import 'package:currency/data/currency/currency_model.dart';
import 'package:flutter/cupertino.dart';

class CurrencyData extends ChangeNotifier {
  CurrencyData(this._currencies);

  List<CurrencyModel> _currencies;

  List<CurrencyModel> get currencies => List.unmodifiable(_currencies);

  void updateCurrencies(List<CurrencyModel> currencies) {
    _currencies = currencies;
    notifyListeners();
  }
}
