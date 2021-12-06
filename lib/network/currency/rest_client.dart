import 'package:currency/data/currency/currency.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://www.nbrb.by/api/exrates/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/rates?ondate={date}&periodicity=0")
  Future<List<Currency>> getCurrencyList(@Path("date") String date);
}
