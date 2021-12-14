import 'package:cherrypick/cherrypick.dart';
import 'package:currency/data/currency/currency_remote_data_source.dart';
import 'package:currency/data/currency/currency_repository.dart';

class CurrencyModule extends Module {
  @override
  void builder(Scope currentScope) {
    bind<CurrencyRepository>()
        .withName("currencyRepository")
        .toInstance(CurrencyRepository(CurrencyRemoteDataSourceImpl()));
  }
}
