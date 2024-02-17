
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time_app/classes/get_data.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // bool? isDay;
   getDataL() async {
    AllCountries oneCountry = AllCountries(flag:'Lebanon',countryName: 'lebanon',link:'Asia/Beirut');
    await oneCountry.getData();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'time': oneCountry.formattedTime,
      'timezone': oneCountry.timezone,
      "isDay": oneCountry.isDay,
    });
    // print(formatedTime);
    // print(timezone);
  }

  @override
  void initState() {
    // TODO: implement initState
    getDataL();
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
