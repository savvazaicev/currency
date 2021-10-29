import 'package:equatable/equatable.dart';

abstract class InitState extends Equatable {
  const InitState();

  factory InitState.initial() = InitInitial;

  factory InitState.inProgress() = InitInProgress;

  factory InitState.initialized(List<String> enabledCurrencies) = Initialized;

  factory InitState.error() = InitError;

  @override
  List<Object> get props => [];
}

class InitInitial extends InitState {}

class InitInProgress extends InitState {}

class Initialized extends InitState {
  final List<String> enabledCurrencies;

  Initialized(this.enabledCurrencies);

  @override
  List<Object> get props => [enabledCurrencies];
}

class InitError extends InitState {}
