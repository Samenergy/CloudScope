import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailedWeatherScreen extends StatelessWidget {
  final String city;
  final String temperature;
  final String highLow;
  final String condition;
  final String iconPath;

  const DetailedWeatherScreen({super.key, 
    required this.city,
    required this.temperature,
    required this.highLow,
    required this.condition,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    // Get the current date and time
    String currentDateTime = _getCurrentDateTime();

    return Scaffold(
      backgroundColor: const Color(0xFF27275D),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  city,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  temperature,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 80,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  condition,
                  style: const TextStyle(color: Colors.white70, fontSize: 20),
                ),
                Text(
                  highLow,
                  style: const TextStyle(color: Colors.white54, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Image.network(
              iconPath,
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),
            Text(
              currentDateTime,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  String _getCurrentDateTime() {
    DateTime now = DateTime.now();
    return DateFormat('EEEE, MMM d, yyyy, h:mm a').format(now);
  }
}
