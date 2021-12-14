import 'package:currency/data/currency/currency_model.dart';
import 'package:currency/network/currency/rest_client.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

abstract class CurrencyRemoteDataSource {
  Future<List<CurrencyModel>> getCurrencyList(RestClient client, DateTime date);
}

class CurrencyRemoteDataSourceImpl implements CurrencyRemoteDataSource {
  @override
  Future<List<CurrencyModel>> getCurrencyList(
      RestClient client, DateTime date) async {
    final dateString = DateFormat("dd.MM.yyyy").format(date);
    final logger = Logger();

    return client.getCurrencyList(dateString).catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          final res = (obj as DioError).response;
          logger.e("Got error : ${res?.statusCode} -> ${res?.statusMessage}");
          break;
        default:
          break;
      }
    });
  }
}
