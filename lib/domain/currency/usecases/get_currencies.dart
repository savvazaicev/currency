import 'package:currency/domain/currency/entities/currency.dart';
import 'package:currency/domain/currency/repositories/currency_repository.dart';
import 'package:currency/domain/usecase.dart';
import 'package:currency/network/currency/rest_client.dart';
import 'package:equatable/equatable.dart';

class GetCurrencies implements UseCase<List<Currency>, Params> {
  final BaseCurrencyRepository repository;

  GetCurrencies(this.repository);

  @override
  Future<List<Currency>> call(Params params) {
    return repository.getCurrencies(params.client);
  }
}

class Params extends Equatable {
  final RestClient client;

  Params(this.client);

  @override
  List<Object> get props => [client];
}
