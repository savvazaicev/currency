import 'package:currency/data/currency/currency.dart';
import 'package:currency/data/currency/currency_repository.dart';
import 'package:currency/network/currency/rest_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'currency_repository_test.mocks.dart';

@GenerateMocks([RestClient])
void main() {
  late BaseCurrencyRepository repository;

  setUp(() {
    repository = CurrencyRepository();
  });

  group("load currencies", () {
    test("returns List<Currency> if the http call success", () async {
      final client = MockRestClient();

      when(client.getCurrencyList(any))
          .thenAnswer((_) async => Future.value(<Currency>[]));

      expect(await repository.loadCurrencies(client, DateTime.now()),
          <Currency>[]);
    });
  });
}
