import 'package:bloc_test/bloc_test.dart';
import 'package:currency/blocs/currency_list_bloc/currency_list_bloc.dart';
import 'package:currency/domain/currency/entities/currency.dart';
import 'package:currency/domain/currency/repositories/currency_repository.dart';
import 'package:currency/domain/currency/usecases/get_currencies.dart';
import 'package:currency/network/currency/rest_client.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'currency_list_bloc_test.mocks.dart';

@GenerateMocks([RestClient, BaseCurrencyRepository, DateTime])
void main() {
  group("CurrencyListBloc", () {
    late CurrencyListBloc bloc;
    late MockBaseCurrencyRepository repository;

    final client = MockRestClient();

    setUp(() {
      repository = MockBaseCurrencyRepository();
      bloc = CurrencyListBloc(
          client: client, getCurrencies: GetCurrencies(repository));
    });

    test("initial state is CurrencyListInitial", () {
      when(repository.getCurrencies(client))
          .thenAnswer((_) => Future.value(<Currency>[]));
      expect(bloc.state, CurrencyListInitial());
    });

    blocTest<CurrencyListBloc, CurrencyListState>(
      "emits loading, loaded states when load event is added",
      build: () => buildBlocWithEmptyCurrencyList(repository, bloc, client),
      act: (bloc) => bloc.add(CurrencyListEvent.load()),
      expect: () => [CurrencyListState.loading(), CurrencyListState.loaded([])],
    );
  });
}

CurrencyListBloc buildBlocWithEmptyCurrencyList(
    MockBaseCurrencyRepository repository,
    CurrencyListBloc bloc,
    RestClient client) {
  when(repository.getCurrencies(client))
      .thenAnswer((_) async => Future.value(<Currency>[]));
  return bloc;
}
