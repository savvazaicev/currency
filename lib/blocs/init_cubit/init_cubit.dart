import 'package:bloc/bloc.dart';
import 'package:currency/blocs/init_cubit/index.dart';
import 'package:currency/utils/pref_helper.dart';

class InitCubit extends Cubit<InitState> {
  InitCubit() : super(InitState.initial());

  void initApp() async {
    final List<String> enabledCurrencies =
        await PrefHelper.getEnabledCurrencyAbbreviations();

    emit(InitState.initialized(enabledCurrencies));
  }
}
