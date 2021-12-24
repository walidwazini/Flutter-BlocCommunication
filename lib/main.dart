import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './Cubit/counter_cubit.dart';
import './Router/App_Router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: _appRouter.myCustomGenerateRoute,
      ),
    );
  }
}