import 'package:bloc/bloc.dart';
import 'package:currency/blocs/init_cubit/index.dart';
import 'package:currency/data/currency/currency_repository.dart';
import 'package:currency/utils/pref_helper.dart';

class InitCubit extends Cubit<InitState> {
  InitCubit({required this.repository}) : super(InitState.initial());

  final CurrencyRepository repository;

  void initApp() async {
    emit(InitState.inProgress());

    final currencies = await repository.loadCurrencies(DateTime.now());
    final List<String> enabledCurrencies =
        await PrefHelper.getEnabledCurrencyAbbreviations();

    emit(InitState.initialized(currencies, enabledCurrencies));
  }
}
