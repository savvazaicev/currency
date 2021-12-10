import 'package:equatable/equatable.dart';

abstract class HomeRoutingEvent extends Equatable {
  const HomeRoutingEvent();

  factory HomeRoutingEvent.settings() = NavigateToSettings;

  factory HomeRoutingEvent.currencyList() = NavigateToCurrencyList;

  @override
  List<Object> get props => [];
}

class NavigateToSettings extends HomeRoutingEvent {}

class NavigateToCurrencyList extends HomeRoutingEvent {}
