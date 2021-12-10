import 'package:bloc/bloc.dart';
import 'package:currency/data/currency/currency.dart';
import 'package:currency/data/currency/currency_item_model.dart';
import 'package:currency/data/currency/currency_repository.dart';
import 'package:currency/network/currency/rest_client.dart';
import 'package:equatable/equatable.dart';

part 'currency_list_event.dart';
part 'currency_list_state.dart';

class CurrencyListBloc extends Bloc<CurrencyListEvent, CurrencyListState> {
  CurrencyListBloc({required this.repository, required this.client})
      : super(CurrencyListState.initial()) {
    on<LoadCurrencyList>(_loadCurrencyList);
  }

  final BaseCurrencyRepository repository;
  final RestClient client;

  Future<void> _loadCurrencyList(
      LoadCurrencyList event, Emitter<CurrencyListState> emit) async {
    emit(CurrencyListState.loading());

    final currencies = await repository.loadCurrencies(client, DateTime.now());
    final yesterdayCurrencies = await repository.loadCurrencies(
        client, DateTime.now().add(Duration(days: -1)));
    final currencyItems = currencies
        .map((currency) => CurrencyItemModel(
            currency,
            yesterdayCurrencies
                    .firstWhere(
                        (yesterdayCurrency) =>
                            yesterdayCurrency.curAbbreviation ==
                            currency.curAbbreviation,
                        orElse: () => Currency.empty())
                    .curOfficialRate ??
                0))
        .toList();

    emit(CurrencyListState.loaded(currencyItems));
  }
}
