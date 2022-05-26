import 'package:flutter/material.dart';
import 'package:helloworld/pages/service/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationWidgetState createState() => _ChooseLocationWidgetState();
}

class _ChooseLocationWidgetState extends State<ChooseLocation> {
  List<WorldTime> listOfLocations = [
    WorldTime(location: "Tunisia", url: "Africa/Tunis", flag: "tunisia.png"),
    WorldTime(location: "Germany", url: "Europe/Berlin", flag: "germany.png"),
    WorldTime(location: "Brazil", url: "America/Cuiaba", flag: "brazil.png"),
    WorldTime(location: "Japan", url: "Asia/Tokyo", flag: "japan.png"),
    WorldTime(location: "Istanbul", url: "Europe/Istanbul", flag: "istanbul.webp"),
  ];

  void update(index, context) async {
    await listOfLocations[index].getTime();
    Navigator.pop(context, {
      "location": listOfLocations[index].location,
      "flag": listOfLocations[index].flag,
      "time": listOfLocations[index].time,
      "dayTime": listOfLocations[index].dayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Choose Location',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.yellow[300],
      ),
      body: ListView.builder(
        itemExtent: 70,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
        itemCount: listOfLocations.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              listOfLocations[index].location,
            ),
            onTap: () => {
              update(index, context)
            },
            leading: CircleAvatar(
              child: Image.asset(
                "assets/flags/${listOfLocations[index].flag}",
              ),
            ),
          );
        },
      ),
    );
  }
}
