import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<Loading> {
  void getWorldTime() {
    WorldTime instanceWorldTime = WorldTime(
      location: "Tunisia",
      url: "Africa/Tunis",
      flag: "tunisia.png",
    );

    instanceWorldTime.getTime();

    Navigator.of(context).pushReplacementNamed(
      "/home",
      arguments: {
        "location": instanceWorldTime.location,
        "flag": instanceWorldTime.flag,
        "time": instanceWorldTime.time,
        "dayTime": instanceWorldTime.dayTime
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SpinKitWave(
        color: Colors.red,
        type: SpinKitWaveType.start,
      ),
    );
  }
}
