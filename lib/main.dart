import 'package:flutter/material.dart';
import 'package:helloworld/pages/home.dart';
import 'package:helloworld/pages/loading.dart';
import 'package:helloworld/pages/choose_location.dart';

void main() => runApp(
      MaterialApp(
        title: "Name",
        // initialRoute: '/home',
        routes: {
          "/": (context) => const Loading(),
          "/home": (context) => const Home(),
          "/chooseLocation": (context) => const ChooseLocation(),
        },
      ),
    );
