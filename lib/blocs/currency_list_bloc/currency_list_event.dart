part of 'currency_list_bloc.dart';

abstract class CurrencyListEvent extends Equatable {
  const CurrencyListEvent();

  factory CurrencyListEvent.load() = LoadCurrencyList;

  @override
  List<Object> get props => [];
}

class LoadCurrencyList extends CurrencyListEvent {}
