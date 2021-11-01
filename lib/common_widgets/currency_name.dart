import 'package:currency/data/currency_list/currency.dart';
import 'package:flutter/material.dart';

class CurrencyName extends StatelessWidget {
  const CurrencyName({
    Key? key,
    required this.currency,
  }) : super(key: key);

  final Currency currency;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${currency.curAbbreviation}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("${currency.curScale} ${currency.curName}"),
            ],
          ),
        ),
      ],
    );
  }
}
