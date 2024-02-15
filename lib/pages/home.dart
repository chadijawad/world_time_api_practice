import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Map recivedData = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/day.png'), fit: BoxFit.cover),
            color: Color.fromARGB(164, 77, 74, 74)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit_location,
                  color: Color.fromARGB(255, 255, 129, 129),
                ),
                label: const Text(
                  'Edit Location',
                  style: TextStyle(fontSize: 19, color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(146, 90, 104, 223),
                  ),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.all(22),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 300,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 33),
                color: const Color.fromARGB(122, 0, 0, 0),
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      recivedData['time'],
                      style: const TextStyle(fontSize: 55, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Text(recivedData['timezone'],
                        style:
                            const TextStyle(fontSize: 28, color: Colors.white))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}