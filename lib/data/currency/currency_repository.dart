import 'package:currency/data/currency/currency_model.dart';
import 'package:currency/data/currency/currency_remote_data_source.dart';
import 'package:currency/domain/currency/entities/currency.dart';
import 'package:currency/domain/currency/repositories/currency_repository.dart';
import 'package:currency/network/currency/rest_client.dart';

class CurrencyRepository implements BaseCurrencyRepository {
  final CurrencyRemoteDataSource remoteDataSource;

  CurrencyRepository(this.remoteDataSource);

  Future<List<Currency>> getCurrencies(RestClient client) async {
    final currencies =
        await remoteDataSource.getCurrencyList(client, DateTime.now());

    final yesterdayCurrencies = await remoteDataSource.getCurrencyList(
        client, DateTime.now().add(Duration(days: -1)));
    final currencyItems = currencies
        .map((currency) => Currency(
            currency,
            yesterdayCurrencies
                    .firstWhere(
                        (yesterdayCurrency) =>
                            yesterdayCurrency.curAbbreviation ==
                            currency.curAbbreviation,
                        orElse: () => CurrencyModel.empty())
                    .curOfficialRate ??
                0))
        .toList();
    return Future.value(currencyItems);
  }
}
