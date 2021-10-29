import 'package:bloc/bloc.dart';

import 'index.dart';

class HomeRoutingBloc extends Bloc<HomeRoutingEvent, HomeRoutingState> {
  HomeRoutingBloc() : super(HomeRoutingState.currencyList()) {
    on<NavigateToCurrencyList>((_, emit) => () {
          emit(HomeRoutingState.currencyList());
        });
    on<NavigateToSettings>((_, emit) => () {
          emit(HomeRoutingState.settings());
        });
  }
}
