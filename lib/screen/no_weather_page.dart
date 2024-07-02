import 'package:flutter/material.dart';

class NoWeather extends StatelessWidget {
  const NoWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            " there is no Weather here bro 😞 start searching now",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
