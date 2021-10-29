import 'package:equatable/equatable.dart';

abstract class HomeRoutingState extends Equatable {
  const HomeRoutingState();

  // factory HomeRoutingState.initial() = HomeRoutingInitial;

  factory HomeRoutingState.settings() = SettingsPageState;

  factory HomeRoutingState.currencyList() = CurrencyListPageState;

  @override
  List<Object> get props => [];
}

// class HomeRoutingInitial extends HomeRoutingState {}

class SettingsPageState extends HomeRoutingState {}

class CurrencyListPageState extends HomeRoutingState {}
