import '../Cubit/counter_cubit.dart';
import '../Screens/FirstScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Screens/SecondScreen.dart';
import '../Screens/ThirdScreen.dart';

class AppRouter {
  Route? myCustomGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) =>
              FirstScreen(),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (_) =>
              SecondScreen(
                title: 'Bloc Provider and Builder',
                color: Colors.red,
              ),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (_) =>
              ThirdScreen(
                title: 'Bloc Consumer',
                color: Colors.deepPurple,
              ),
        );
      default:
        return null;
    }
  }

  // void dispose(){
  //   _counterCubit.close();
  // }


}
