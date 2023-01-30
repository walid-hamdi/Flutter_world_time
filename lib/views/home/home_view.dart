import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;

    var bgColor = data["dayTime"] ? Colors.blue[500] : Colors.grey[900];

    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow[400],
              ),
              onPressed: () async {
                dynamic result =
                    await Navigator.pushNamed(context, "/chooseLocation");
                setState(() {
                  data = {
                    "location": result["location"],
                    "flag": result["flag"],
                    "time": result["time"],
                    "dayTime": result["dayTime"]
                  };
                });
              },
              child: const Text(
                'Edit Location',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              data["location"] ?? "",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  data["time"] ?? "",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
