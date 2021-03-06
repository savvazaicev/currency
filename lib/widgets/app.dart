import 'package:currency/blocs/init_cubit/index.dart';
import 'package:currency/data/currency/currency_remote_data_source.dart';
import 'package:currency/widgets/init_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'currency',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) =>
            InitCubit(remoteDataSource: CurrencyRemoteDataSourceImpl()),
        child: InitWidget(),
      ),
    );
  }
}
