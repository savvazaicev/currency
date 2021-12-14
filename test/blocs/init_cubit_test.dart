import 'package:bloc_test/bloc_test.dart';
import 'package:currency/blocs/init_cubit/index.dart';
import 'package:currency/data/currency/currency_model.dart';
import 'package:currency/data/currency/currency_remote_data_source.dart';
import 'package:currency/data/currency/currency_repository.dart';
import 'package:currency/domain/currency/entities/currency.dart';
import 'package:currency/network/currency/rest_client.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart';

import 'init_cubit_test.mocks.dart';

@GenerateMocks([CurrencyRepository, CurrencyRemoteDataSource, RestClient])
void main() {
  group("InitCubit", () {
    late InitCubit cubit;
    late MockCurrencyRepository repository;
    late MockCurrencyRemoteDataSource remoteDataSource;

    setUp(() {
      repository = MockCurrencyRepository();
      remoteDataSource = MockCurrencyRemoteDataSource();
      cubit = InitCubit(remoteDataSource: remoteDataSource);
    });

    test("initial state is InitInitial", () {
      expect(cubit.state, InitState.initial());
    });

    final client = MockRestClient();

    blocTest<InitCubit, InitState>(
      "emits inProgress, initialized state when initApp() is called",
      build: () {
        when(repository.getCurrencies(client))
            .thenAnswer((realInvocation) => Future.value(<Currency>[]));
        when(remoteDataSource.getCurrencyList(client, any))
            .thenAnswer((realInvocation) => Future.value(<CurrencyModel>[]));

        return cubit;
      },
      act: (cubit) => cubit.initApp(client),
      expect: () => [InitState.inProgress(), InitState.initialized([], [])],
    );
  });
}
