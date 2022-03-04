import 'package:bloc_training_flutterly/presentation/screen/home_screen.dart';
import 'package:bloc_training_flutterly/presentation/screen/second_screen.dart';
import 'package:bloc_training_flutterly/presentation/screen/setting_screen.dart';
import 'package:bloc_training_flutterly/presentation/screen/third_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (context) => HomeScreen(
                  title: 'Home Screen',
                  color: Colors.blueAccent,
                ));
        break;
      case '/second':
        return MaterialPageRoute(
            builder: (context) => SecondScreen(
                  title: 'Second Screen',
                  color: Colors.redAccent,
                ));
        break;
      case '/third':
        return MaterialPageRoute(
            builder: (context) => ThirdScreen(
                  title: 'Third Screen',
                  color: Colors.greenAccent,
                ));
        break;
      case '/setting':
        return MaterialPageRoute(
          builder: (context) => SettingScreen(),
        );
        break;
      default:
        return null;
    }
  }
}
