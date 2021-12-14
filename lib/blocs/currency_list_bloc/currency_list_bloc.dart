import 'package:bloc/bloc.dart';
import 'package:currency/domain/currency/entities/currency.dart';
import 'package:currency/domain/currency/usecases/get_currencies.dart';
import 'package:currency/network/currency/rest_client.dart';
import 'package:equatable/equatable.dart';

part 'currency_list_event.dart';
part 'currency_list_state.dart';

class CurrencyListBloc extends Bloc<CurrencyListEvent, CurrencyListState> {
  CurrencyListBloc({required this.client, required this.getCurrencies})
      : super(CurrencyListState.initial()) {
    on<LoadCurrencyList>(_loadCurrencyList);
  }

  final GetCurrencies getCurrencies;
  final RestClient client;

  Future<void> _loadCurrencyList(
      LoadCurrencyList event, Emitter<CurrencyListState> emit) async {
    emit(CurrencyListState.loading());

    final currencyList = await getCurrencies.call(Params(client));

    emit(CurrencyListState.loaded(currencyList));
  }
}
