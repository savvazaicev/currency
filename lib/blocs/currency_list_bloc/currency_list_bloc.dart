import 'package:bloc/bloc.dart';
import 'package:currency/data/currency.dart';
import 'package:currency/data/currency_repository.dart';
import 'package:equatable/equatable.dart';

part 'currency_list_event.dart';
part 'currency_list_state.dart';

class CurrencyListBloc extends Bloc<CurrencyListEvent, CurrencyListState> {
  CurrencyListBloc({required this.repository})
      : super(CurrencyListState.initial()) {
    on<LoadCurrencyList>(_loadCurrencyList);
    add(CurrencyListEvent.load());
  }

  final CurrencyRepository repository;

  Future<void> _loadCurrencyList(
      LoadCurrencyList event, Emitter<CurrencyListState> emit) async {
    final currencies = await repository.loadCurrencies(DateTime.now());
    emit(CurrencyListState.loaded(currencies));
  }
}
