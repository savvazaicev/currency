import 'package:currency/domain/currency/entities/currency.dart';
import 'package:currency/network/currency/rest_client.dart';

abstract class BaseCurrencyRepository {
  Future<List<Currency>> getCurrencies(RestClient client);
}
