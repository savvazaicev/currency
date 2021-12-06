import 'package:currency/common_widgets/currency_name.dart';
import 'package:currency/data/currency/currency_item_model.dart';
import 'package:currency/widgets/currency_list/widgets/center_text.dart';
import 'package:flutter/material.dart';

class CurrencyListItem extends StatelessWidget {
  const CurrencyListItem({Key? key, required this.model}) : super(key: key);

  final CurrencyItemModel model;

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
