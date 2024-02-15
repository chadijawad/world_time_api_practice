import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 191, 191, 199),
      appBar: AppBar(
        title: const Text(' Choose Location'),
        backgroundColor: const Color.fromARGB(146, 12, 16, 49),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                onTap: () {},
                title: const Text('Egypt,Cairo',style: TextStyle(fontSize: 22),),
                leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/morocco.png'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
