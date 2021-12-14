import 'package:currency/data/currency/currency_model.dart';
import 'package:currency/data/currency/currency_remote_data_source.dart';
import 'package:currency/data/currency/currency_repository.dart';
import 'package:currency/domain/currency/entities/currency.dart';
import 'package:currency/domain/currency/repositories/currency_repository.dart';
import 'package:currency/network/currency/rest_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../blocs/init_cubit_test.mocks.dart';
import 'currency_repository_test.mocks.dart';

@GenerateMocks([RestClient, CurrencyRemoteDataSource])
void main() {
  late BaseCurrencyRepository repository;
  late MockCurrencyRemoteDataSource remoteDataSource;

  setUp(() {
    remoteDataSource = MockCurrencyRemoteDataSource();
    repository = CurrencyRepository(remoteDataSource);
  });

  group("load currencies", () {
    test("returns List<Currency> if the http call success", () async {
      final client = MockRestClient();

      when(client.getCurrencyList(any))
          .thenAnswer((_) async => Future.value(<CurrencyModel>[]));
      when(remoteDataSource.getCurrencyList(client, any))
          .thenAnswer((realInvocation) => Future.value(<CurrencyModel>[]));

      expect(await repository.getCurrencies(client), <Currency>[]);
    });
  });
}
