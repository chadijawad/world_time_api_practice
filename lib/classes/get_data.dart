import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class AllCountries {
  final String flag;
  final String link;
  final String countryName;
 AllCountries({required this.countryName, required this.flag,required this.link});
  late bool isDay;
  late String formattedTime;
  late String timezone;
  getData() async {
    Response response = await get(
        Uri.parse('http://worldtimeapi.org/api/timezone/$link'));
    Map recivedData = jsonDecode(response.body);
    DateTime dateTime = DateTime.parse(recivedData['utc_datetime']);
    int offset = int.parse(recivedData['utc_offset'].substring(0, 3));
    DateTime time = dateTime.add(Duration(hours: offset));
    if (time.hour > 5 && time.hour < 18) {
      isDay = true;
    } else {
      isDay = false;
    }
    formattedTime = DateFormat('hh:mm a').format(time);
    timezone = recivedData['timezone'];
  }
}
