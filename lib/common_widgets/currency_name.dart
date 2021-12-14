import 'package:currency/data/currency/currency_model.dart';
import 'package:flutter/material.dart';

class CurrencyName extends StatelessWidget {
  const CurrencyName({
    Key? key,
    required this.currency,
  }) : super(key: key);

  final CurrencyModel currency;

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
