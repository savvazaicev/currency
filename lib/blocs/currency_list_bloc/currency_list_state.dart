part of 'currency_list_bloc.dart';

abstract class CurrencyListState extends Equatable {
  const CurrencyListState();

  factory CurrencyListState.initial() = CurrencyListInitial;

  factory CurrencyListState.loading() = CurrencyListLoading;

  factory CurrencyListState.loaded(List<Currency> currencies) =
      CurrencyListLoaded;

  @override
  List<Object> get props => [];
}

class CurrencyListInitial extends CurrencyListState {}

class CurrencyListLoading extends CurrencyListState {}

class CurrencyListLoaded extends CurrencyListState {
  final List<Currency> currencies;

  CurrencyListLoaded(this.currencies);

  @override
  List<Object> get props => [currencies];
}
