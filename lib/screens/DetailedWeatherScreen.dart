import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailedWeatherScreen extends StatelessWidget {
  final String city;
  final String temperature;
  final String highLow;
  final String condition;
  final String iconPath;

  DetailedWeatherScreen({
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
      backgroundColor: Color(0xFF27275D),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Spacer(),
                ],
              ),
            ),
            SizedBox(height: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  city,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  temperature,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 80,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  condition,
                  style: TextStyle(color: Colors.white70, fontSize: 20),
                ),
                Text(
                  highLow,
                  style: TextStyle(color: Colors.white54, fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),
            Image.network(
              iconPath,
              width: 150,
              height: 150,
            ),
            SizedBox(height: 20),
            Text(
              currentDateTime,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20),
            Spacer(),
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
