/// Cur_ID : 440
/// Date : "2021-10-27T00:00:00"
/// Cur_Abbreviation : "AUD"
/// Cur_Scale : 1
/// Cur_Name : "Австралийский доллар"
/// Cur_OfficialRate : 1.8113

class Currency {
  Currency({
    int? curID,
    String? date,
    String? curAbbreviation,
    int? curScale,
    String? curName,
    double? curOfficialRate,
  }) {
    _curID = curID;
    _date = date;
    _curAbbreviation = curAbbreviation;
    _curScale = curScale;
    _curName = curName;
    _curOfficialRate = curOfficialRate;
  }

  Currency.fromJson(dynamic json) {
    _curID = json['Cur_ID'];
    _date = json['Date'];
    _curAbbreviation = json['Cur_Abbreviation'];
    _curScale = json['Cur_Scale'];
    _curName = json['Cur_Name'];
    _curOfficialRate = json['Cur_OfficialRate'];
  }
  int? _curID;
  String? _date;
  String? _curAbbreviation;
  int? _curScale;
  String? _curName;
  double? _curOfficialRate;

  int? get curID => _curID;
  String? get date => _date;
  String? get curAbbreviation => _curAbbreviation;
  int? get curScale => _curScale;
  String? get curName => _curName;
  double? get curOfficialRate => _curOfficialRate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Cur_ID'] = _curID;
    map['Date'] = _date;
    map['Cur_Abbreviation'] = _curAbbreviation;
    map['Cur_Scale'] = _curScale;
    map['Cur_Name'] = _curName;
    map['Cur_OfficialRate'] = _curOfficialRate;
    return map;
  }
}
