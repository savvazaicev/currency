import 'package:cherrypick/cherrypick.dart';
import 'package:currency/di/modules/currency_module.dart';
import 'package:currency/widgets/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/app_bloc_observer.dart';

final rootScope = openRootScope();

void main() {
  Bloc.observer = AppBlocObserver();
  rootScope.installModules([CurrencyModule()]);

  runApp(App());
}
