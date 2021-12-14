import 'package:bloc/bloc.dart';
import 'package:currency/blocs/init_cubit/index.dart';
import 'package:currency/data/currency/currency_remote_data_source.dart';
import 'package:currency/network/currency/rest_client.dart';
import 'package:currency/utils/pref_helper.dart';

class InitCubit extends Cubit<InitState> {
  InitCubit({required this.remoteDataSource}) : super(InitState.initial());

  final CurrencyRemoteDataSource remoteDataSource;

  void initApp(RestClient client) async {
    emit(InitState.inProgress());

    final currencies =
        await remoteDataSource.getCurrencyList(client, DateTime.now());
    final List<String> enabledCurrencies =
        await PrefHelper.getEnabledCurrencyAbbreviations();

    emit(InitState.initialized(currencies, enabledCurrencies));
  }
}
