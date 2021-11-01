import 'package:currency/widgets/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/app_bloc_observer.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(App());
}
