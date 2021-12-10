import 'package:bloc_test/bloc_test.dart';
import 'package:currency/blocs/home_routing_bloc/index.dart';
import 'package:test/test.dart';

void main() {
  group("HomeRoutingBloc", () {
    late HomeRoutingBloc bloc;

    setUp(() {
      bloc = HomeRoutingBloc();
    });

    test("initial state is CurrencyList", () {
      expect(bloc.state, HomeRoutingState.currencyList());
    });

    blocTest<HomeRoutingBloc, HomeRoutingState>(
      "emits currencyList state when currencyList event is added",
      build: () => bloc,
      act: (bloc) => bloc.add(HomeRoutingEvent.currencyList()),
      expect: () => [HomeRoutingState.currencyList()],
    );

    blocTest<HomeRoutingBloc, HomeRoutingState>(
      "emits settings state when settings event is added",
      build: () => bloc,
      act: (bloc) => bloc.add(HomeRoutingEvent.settings()),
      expect: () => [HomeRoutingState.settings()],
    );
  });
}
