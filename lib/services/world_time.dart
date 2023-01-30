import 'package:http/http.dart' as http;
import 'dart:convert';

class WorldTime {
  String location;
  late String time;
  String url;
  String flag;
  bool dayTime = false;

  WorldTime({
    required this.location,
    required this.url,
    required this.flag,
  });

  Future<void> getTime() async {
    try {
      var response = await http.get(
        Uri.parse(
          "https://api.ipgeolocation.io/timezone?apiKey=d889ef066d714ebdadadbddbd73de8cc&tz=$url",
        ),
      );
      Map data = jsonDecode(response.body);

      time = data["date_time"].split(" ")[1];
      time = time.substring(0, 5);

      int timeNumber = int.parse(time.split(":")[0]);

      if (timeNumber < 20 && timeNumber > 6) {
        dayTime = true;
      }
    } catch (e) {
      time = "There is no way to get the date time";
    }
  }
}
