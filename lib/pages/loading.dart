import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // bool? isDay;
  late bool isDay;
  getData() async {
    Response response = await get(
        Uri.parse('http://worldtimeapi.org/api/timezone/Asia/Beirut'));
    Map recivedData = jsonDecode(response.body);
    DateTime dateTime = DateTime.parse(recivedData['utc_datetime']);
    int offset = int.parse(recivedData['utc_offset'].substring(0, 3));
    DateTime time = dateTime.add(Duration(hours: offset));
    if (time.hour > 5 && time.hour < 18) {
      isDay = true;
    } else {
      isDay = false;
    }
    String formatedTime = DateFormat('hh:mm a').format(time);
    String timezone = recivedData['timezone'];
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'time': formatedTime,
      'timezone': timezone,
      "isDay": isDay,
    });
    // print(formatedTime);
    // print(timezone);
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitCubeGrid(
              color: Color.fromARGB(146, 12, 16, 49),
              size: 90,
            )
          ],
        ),
      ),
    );
  }
}
