import 'package:currency/blocs/home_routing_bloc/index.dart';
import 'package:flutter/material.dart';
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
              onPressed: () => context
                  .read<HomeRoutingBloc>()
                  .add(HomeRoutingEvent.settings()))
        ],
      ),
      body: Center(
        child: Text("CurrencyList"),
      ),
    );
  }
}
