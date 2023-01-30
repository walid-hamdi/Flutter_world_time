import 'package:flutter/material.dart';

import '../views/chose_location/choose_location_view.dart';
import '../views/home/home_view.dart';
import '../views/loading_view.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      title: "Name",
      // initialRoute: '/home',
      routes: {
        "/": (context) => const Loading(),
        "/home": (context) => const Home(),
        "/chooseLocation": (context) => const ChooseLocation(),
      },
    );
  }
}
