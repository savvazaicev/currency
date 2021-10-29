import 'package:currency/blocs/home_routing_bloc/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeRoutingBloc = context.read<HomeRoutingBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Настройка валют"),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => homeRoutingBloc.add(HomeRoutingEvent.home())),
        actions: [
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                //TODO save selected currencies
                homeRoutingBloc.add(HomeRoutingEvent.home());
              })
        ],
      ),
      body: Center(
        child: Text("Settings"),
      ),
    );
  }
}
