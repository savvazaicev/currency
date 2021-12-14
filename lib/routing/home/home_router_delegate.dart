import 'package:currency/blocs/currency_list_bloc/currency_list_bloc.dart';
import 'package:currency/blocs/home_routing_bloc/index.dart';
import 'package:currency/data/currency/currency_repository.dart';
import 'package:currency/domain/currency/usecases/get_currencies.dart';
import 'package:currency/network/currency/rest_client.dart';
import 'package:currency/routing/home/routes.dart';
import 'package:currency/widgets/currency_list/currency_list_page.dart';
import 'package:currency/widgets/settings/settings_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../main.dart';

final GlobalKey<NavigatorState> homeNavigatorKey = GlobalKey<NavigatorState>();

class HomeRouterDelegate extends RouterDelegate<HomeRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<HomeRoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey = homeNavigatorKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeRoutingBloc, HomeRoutingState>(
      builder: (context, state) {
        return Navigator(
          key: navigatorKey,
          pages: [
            if (state is CurrencyListPageState)
              MaterialPage(
                  child: BlocProvider(
                create: (context) => CurrencyListBloc(
                    client: RestClient(Dio()),
                    getCurrencies: GetCurrencies(
                        rootScope.resolve<CurrencyRepository>(
                            named: "currencyRepository")))
                  ..add(CurrencyListEvent.load()),
                child: CurrencyListPage(),
              )),
            if (state is SettingsPageState) MaterialPage(child: SettingsPage()),
          ],
          onPopPage: (route, result) {
            if (!route.didPop(result)) return false;

            notifyListeners();
            return true;
          },
        );
      },
    );
  }

  @override
  Future<void> setNewRoutePath(HomeRoutePath configuration) async {
    // TODO: implement setNewRoutePath
    assert(false);
  }
}
