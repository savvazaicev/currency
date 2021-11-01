import 'package:currency/blocs/home_routing_bloc/init_navigation_bloc.dart';
import 'package:currency/blocs/init_cubit/index.dart';
import 'package:currency/common_widgets/circular_progress.dart';
import 'package:currency/data/providers/currency_data.dart';
import 'package:currency/data/providers/settings_data.dart';
import 'package:currency/routing/home/home_router_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class InitWidget extends StatefulWidget {
  const InitWidget({Key? key}) : super(key: key);

  @override
  _InitWidgetState createState() => _InitWidgetState();
}

class _InitWidgetState extends State<InitWidget> {
  HomeRouterDelegate _routerDelegate = HomeRouterDelegate();

  @override
  void initState() {
    super.initState();
    context.read<InitCubit>().initApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<InitCubit, InitState>(
        builder: (context, state) {
          if (state is Initialized) {
            return MultiProvider(
                providers: [
                  ChangeNotifierProvider(
                      create: (_) => SettingsData(state.enabledCurrencies)),
                  ChangeNotifierProvider(
                      create: (_) => CurrencyData(state.currencies))
                ],
                child: BlocProvider(
                  create: (context) => HomeRoutingBloc(),
                  child: Router(
                    routerDelegate: _routerDelegate,
                  ),
                ));
          }

          if (state is InitError) {
            return const Center(child: Text("No data"));
          }
          return CircularProgress();
        },
      ),
    );
  }
}
