import 'package:currency/data/currency_list/currency.dart';

class CurrencyItemModel {
  final Currency currency;
  final double yesterdayPrice;

  CurrencyItemModel(this.currency, this.yesterdayPrice);
}
