import 'dart:convert';

import 'package:currency/data/currency_list/currency.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class CurrencyRepository {
  Future<List<Currency>> loadCurrencies(DateTime date) async {
    final dateString = DateFormat("dd.MM.yyyy").format(date);

    final response = await http.get(Uri.parse(
        "https://www.nbrb.by/api/exrates/rates?ondate=$dateString&periodicity=0"));
    if (response.statusCode == 200) {
      final Iterable data = jsonDecode(response.body);
      return data.map((model) => Currency.fromJson(model)).toList();
    } else {
      throw Exception("Failed to load currency");
    }
  }
}
