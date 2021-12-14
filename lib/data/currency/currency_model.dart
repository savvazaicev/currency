import 'package:json_annotation/json_annotation.dart';

part 'currency_model.g.dart';

/// Cur_ID : 440
/// Date : "2021-10-27T00:00:00"
/// Cur_Abbreviation : "AUD"
/// Cur_Scale : 1
/// Cur_Name : "Австралийский доллар"
/// Cur_OfficialRate : 1.8113

@JsonSerializable()
class CurrencyModel {
  CurrencyModel(this.curID, this.date, this.curAbbreviation, this.curScale,
      this.curName, this.curOfficialRate);

  @JsonKey(name: 'Cur_ID')
  final int? curID;
  @JsonKey(name: 'Date')
  final String? date;
  @JsonKey(name: 'Cur_Abbreviation')
  final String? curAbbreviation;
  @JsonKey(name: 'Cur_Scale')
  final int? curScale;
  @JsonKey(name: 'Cur_Name')
  final String? curName;
  @JsonKey(name: 'Cur_OfficialRate')
  final double? curOfficialRate;

  factory CurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyModelFromJson(json);

  factory CurrencyModel.empty() =>
      CurrencyModel(null, null, null, null, null, null);

  Map<String, dynamic> toJson() => _$CurrencyModelToJson(this);
}
