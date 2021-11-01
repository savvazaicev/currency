import 'package:currency/blocs/home_routing_bloc/index.dart';
import 'package:currency/common_widgets/currency_name.dart';
import 'package:currency/data/providers/currency_data.dart';
import 'package:currency/data/providers/settings_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeRoutingBloc = context.read<HomeRoutingBloc>();
    final currencies = context.read<CurrencyData>().currencies;
    final settingsData = context.watch<SettingsData>();
    final enabledCurrencies = settingsData.enabledCurrencies;

    return Scaffold(
      appBar: AppBar(
        title: Text("Настройка валют"),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () =>
                homeRoutingBloc.add(HomeRoutingEvent.currencyList())),
        actions: [
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                //TODO save selected currencies
                homeRoutingBloc.add(HomeRoutingEvent.currencyList());
              })
        ],
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: currencies.length,
          itemBuilder: (context, index) {
            final currency = currencies[index];
            return Row(
              children: [
                Flexible(flex: 2, child: CurrencyName(currency: currency)),
                Switch(
                    value: enabledCurrencies.contains(currency.curAbbreviation),
                    onChanged: (isEnabled) {
                      final updatedEnabledCurrencies =
                          List.from(enabledCurrencies);
                      if (isEnabled) {
                        updatedEnabledCurrencies.add(currency.curAbbreviation);
                      } else {
                        updatedEnabledCurrencies.removeWhere((abbreviation) =>
                            abbreviation == currency.curAbbreviation);
                      }
                      settingsData.updateEnabledCurrencies(enabledCurrencies);
                    })
              ],
            );
          }),
    );
  }
}
