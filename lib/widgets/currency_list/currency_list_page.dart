import 'package:currency/blocs/currency_list_bloc/currency_list_bloc.dart';
import 'package:currency/blocs/home_routing_bloc/index.dart';
import 'package:currency/common_widgets/circular_progress.dart';
import 'package:currency/widgets/currency_list/widgets/currency_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CurrencyListPage extends StatelessWidget {
  const CurrencyListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Курсы валют"),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => Navigator.pop(context)),
        actions: [
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                context
                    .read<HomeRoutingBloc>()
                    .add(HomeRoutingEvent.settings());
              })
        ],
      ),
      body: BlocBuilder<CurrencyListBloc, CurrencyListState>(
        builder: (context, state) {
          if (state is CurrencyListLoaded) {
            final currencies = state.currencies;

            //TODO filter currencies
            // final settingsData = context.watch<SettingsData>();
            // final enabledCurrencies = settingsData.enabledCurrencies;

            // final filteredCurrencies = currencies
            //     .where((currency) => enabledCurrencies
            //         .contains(currency.currency.curAbbreviation))
            //     .toList();

            return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: currencies.length,
                separatorBuilder: (context, index) => SizedBox(height: 8),
                itemBuilder: (context, index) =>
                    CurrencyListItem(model: currencies[index]));
          }
          return CircularProgress();
        },
      ),
    );
  }
}
