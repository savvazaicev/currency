import 'package:currency/common_widgets/currency_name.dart';
import 'package:currency/domain/currency/entities/currency.dart';
import 'package:currency/widgets/currency_list/widgets/center_text.dart';
import 'package:flutter/material.dart';

class CurrencyListItem extends StatelessWidget {
  const CurrencyListItem({Key? key, required this.model}) : super(key: key);

  final Currency model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(flex: 2, child: CurrencyName(currency: model.currency)),
        Flexible(flex: 1, child: CenterText("${model.yesterdayPrice}")),
        Flexible(
            flex: 1, child: CenterText("${model.currency.curOfficialRate}")),
      ],
    );
  }
}
