import 'package:flutter/material.dart';

import '../views/choose_location/choose_location_view.dart';
import '../views/home/home_view.dart';
import '../views/loading_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
