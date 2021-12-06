import 'package:currency/data/currency/currency.dart';
import 'package:currency/network/currency/rest_client.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class CurrencyRepository {
  Future<List<Currency>> loadCurrencies(DateTime date) async {
    final dateString = DateFormat("dd.MM.yyyy").format(date);
    final logger = Logger();

    final client = RestClient(Dio());
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
