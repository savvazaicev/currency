import '../../../data/currency/currency_model.dart';

class Currency {
  final CurrencyModel currency;
  final double yesterdayPrice;

  Currency(this.currency, this.yesterdayPrice);
}
