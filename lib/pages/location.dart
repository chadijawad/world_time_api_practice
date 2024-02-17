import 'package:flutter/material.dart';
import 'package:world_time_app/classes/get_data.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<AllCountries> allCountriesL = [
    AllCountries(
        link: 'Africa/Cairo', countryName: 'Egypt - Cairo', flag: 'egypt.png'),
    AllCountries(
        link: 'Africa/Tunis',
        countryName: 'Tunisia - Tunis',
        flag: 'tunisia.png'),
    AllCountries(
        link: 'Africa/Algiers',
        countryName: 'Algeria - Algiers',
        flag: 'algeria.png'),
    AllCountries(
        link: 'Australia/Sydney',
        countryName: 'Australia - Sydney',
        flag: 'australia.png'),
    AllCountries(
        link: 'America/Toronto',
        countryName: 'Canada - Toronto',
        flag: 'canada.png'),
    AllCountries(
        link: 'Asia/Riyadh',
        countryName: '	Saudi Arabia - Riyadh',
        flag: 'sa.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 191, 191, 199),
        appBar: AppBar(
          title: const Text(' Choose Location'),
          backgroundColor: const Color.fromARGB(146, 12, 16, 49),
        ),
        body: SizedBox(
          child: ListView.builder(
              itemCount: allCountriesL.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                      onTap: ()async {
                        AllCountries allCountries = AllCountries(
                                countryName: allCountriesL[index].countryName,
                                flag: allCountriesL[index].flag,
                                link: allCountriesL[index].link);
                            await allCountries.getData();
                        Navigator.pop(context, {
                          'time': allCountries.formattedTime,
                          'timezone': allCountries.timezone,
                          'isDay': allCountries.isDay,
                        });
                      },
                      title: Text(
                        allCountriesL[index].countryName,
                        style: const TextStyle(fontSize: 22),
                      ),
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/${allCountriesL[index].flag}'),
                      ),
                    ),
                  ),
                );
              }),
        ));
  }
}
