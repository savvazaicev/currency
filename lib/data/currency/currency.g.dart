// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Currency _$CurrencyFromJson(Map<String, dynamic> json) => Currency(
      json['Cur_ID'] as int?,
      json['Date'] as String?,
      json['Cur_Abbreviation'] as String?,
      json['Cur_Scale'] as int?,
      json['Cur_Name'] as String?,
      (json['Cur_OfficialRate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CurrencyToJson(Currency instance) => <String, dynamic>{
      'Cur_ID': instance.curID,
      'Date': instance.date,
      'Cur_Abbreviation': instance.curAbbreviation,
      'Cur_Scale': instance.curScale,
      'Cur_Name': instance.curName,
      'Cur_OfficialRate': instance.curOfficialRate,
    };
