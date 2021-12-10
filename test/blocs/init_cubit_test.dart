import 'package:bloc_test/bloc_test.dart';
import 'package:currency/blocs/init_cubit/index.dart';
import 'package:currency/data/currency/currency.dart';
import 'package:currency/data/currency/currency_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../data/currency_repository_test.mocks.dart';
import 'init_cubit_test.mocks.dart';

@GenerateMocks([CurrencyRepository])
void main() {
  group("InitCubit", () {
    late InitCubit cubit;
    late MockCurrencyRepository repository;

    setUp(() {
      repository = MockCurrencyRepository();
      cubit = InitCubit(repository: repository);
    });

    test("initial state is InitInitial", () {
      expect(cubit.state, InitState.initial());
    });

    final client = MockRestClient();

    blocTest<InitCubit, InitState>(
      "emits inProgress, initialized state when initApp() is called",
      build: () {
        when(repository.loadCurrencies(client, any))
            .thenAnswer((realInvocation) => Future.value(<Currency>[]));

        return cubit;
      },
      act: (cubit) => cubit.initApp(client),
      expect: () => [InitState.inProgress(), InitState.initialized([], [])],
    );
  });
}
