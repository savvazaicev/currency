import 'package:bloc/bloc.dart';
import 'package:currency/data/currency/currency_item_model.dart';
import 'package:currency/data/currency/currency_repository.dart';
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
    emit(CurrencyListState.loading());

    //TODO extract to interactor
    final currencies = await repository.loadCurrencies(DateTime.now());
    final yesterdayCurrencies =
        await repository.loadCurrencies(DateTime.now().add(Duration(days: -1)));
    final currencyItems = currencies
        .map((currency) => CurrencyItemModel(
            currency,
            yesterdayCurrencies
                    .firstWhere((yesterdayCurrency) =>
                        yesterdayCurrency.curAbbreviation ==
                        currency.curAbbreviation)
                    .curOfficialRate ??
                0))
        .toList();

    emit(CurrencyListState.loaded(currencyItems));
  }
}
