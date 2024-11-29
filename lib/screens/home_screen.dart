import 'package:flutter/material.dart';
import './DetailedWeatherScreen.dart'; 
import 'weather_service.dart'; 

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherService weatherService = WeatherService();
  List<Map<String, String>> weatherData = [];
  bool isLoading = false;
  final TextEditingController searchController =
      TextEditingController(); 

  void fetchWeatherData(String city) async {
    setState(() {
      isLoading = true; 
    });

    try {
      final data = await weatherService.fetchWeather(city);
      setState(() {
        weatherData = [
          {
            'city': city,
            'temperature':
                '${_roundTemperature(data['main']['temp'])}°', 
            'highLow':
                'H:${data['main']['temp_max']}° L:${data['main']['temp_min']}°',
            'condition': data['weather'][0]['description'],
            'icon':
                'http://openweathermap.org/img/wn/${data['weather'][0]['icon']}@2x.png', 
          }
        ];
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching weather for $city: $e');
      setState(() {
        isLoading = false; 
      });
    }
  }

  int _roundTemperature(double temp) {
    return temp.round(); 
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF27275D), 
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'CloudScope',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFF3A3A68),
                hintText: 'Search for a city',
                hintStyle: const TextStyle(color: Colors.white54),
                prefixIcon: const Icon(Icons.search, color: Colors.white54),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: Colors.white), 
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  fetchWeatherData(
                      value); 
                }
              },
            ),
            const SizedBox(height: 16),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator()) 
                : weatherData.isEmpty
                    ? const Center(
                        child: Text("No data available",
                            style: TextStyle(color: Colors.white)))
                    : Expanded(
                        child: ListView.builder(
                          itemCount: weatherData.length,
                          itemBuilder: (context, index) {
                            final weather = weatherData[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailedWeatherScreen(
                                      city: weather['city']!,
                                      temperature: weather['temperature']!,
                                      highLow: weather['highLow']!,
                                      condition: weather['condition']!,
                                      iconPath: weather['icon']!,
                                    ),
                                  ),
                                );
                              },
                              child: WeatherCard(
                                city: weather['city']!,
                                temperature: weather['temperature']!,
                                highLow: weather['highLow']!,
                                condition: weather['condition']!,
                                iconPath: weather['icon']!,
                              ),
                            );
                          },
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  final String city;
  final String temperature;
  final String highLow;
  final String condition;
  final String iconPath;

  const WeatherCard({super.key, 
    required this.city,
    required this.temperature,
    required this.highLow,
    required this.condition,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF3A3A68),
        borderRadius: BorderRadius.circular(16.0),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Image.network(
            iconPath,
            width: 50,
            height: 50,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  temperature,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  city,
                  style: const TextStyle(color: Colors.white70, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  condition,
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          Text(
            highLow,
            style: const TextStyle(color: Colors.white54, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
