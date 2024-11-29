# CloudScope

**CloudScope** is a simple and user-friendly weather application that provides real-time weather updates for any city. Built with Flutter, the app integrates seamlessly with the OpenWeatherMap API to fetch accurate weather data.

---

## Features

- Search for weather updates by city.
- View real-time weather conditions, including:
  - Temperature (current, high, and low).
  - Weather conditions (e.g., sunny, cloudy, rainy).
  - Corresponding weather icons.
- Detailed weather screen with:
  - Current date and time.
  - Comprehensive weather description.
- Responsive and visually appealing UI with a dark theme.

---

## Tech Stack

- **Frontend:** Flutter (Dart)
- **Backend API:** OpenWeatherMap API
- **Packages Used:**
  - `http` for API requests.
  - `intl` for date and time formatting.

---

## Installation and Setup

1. **Clone the Repository**
   ```bash
   git clone https://github.com/Samenergy/CloudScope.git
   cd cloudscope
   ```

2. **Set Up Dependencies**
   Install the required Flutter packages:
   ```bash
   flutter pub get
   ```

3. **Run the App**
   Use the Flutter CLI to run the app on an emulator or physical device:
   ```bash
   flutter run
   ```

---

## Code Structure

### **Key Files and Directories:**

- `lib/`
  - `main.dart`: Entry point of the application.
  - `screens/homescreen.dart`: Contains the home screen UI and logic.
  - `components/weather_card.dart`: Reusable component for displaying weather data.
  - `screens/detailed_weather_screen.dart`: UI for detailed weather information.
  - `services/weather_service.dart`: Handles API integration and data fetching.

### **Key Functions:**

- **`fetchWeatherData(String city)`**
  - Fetches weather data from the OpenWeatherMap API.
  - Parses and returns the necessary weather information.

- **Error Handling:**
  - Displays appropriate error messages in case of failed API requests.

---

## Demo

1. **Search for a City:**
   - Enter a city name in the search bar and press enter.
   - View the current weather conditions.

2. **Detailed Weather View:**
   - Tap on a weather card to view more details about the selected city.

---

## Future Enhancements

- Add weekly weather forecasts.
- Implement user accounts to save favorite cities.
- Include push notifications for severe weather alerts.
- Add localization for multiple languages.

---

## Contributing

Contributions are welcome! To contribute:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Commit your changes and push them to your branch.
4. Submit a pull request explaining your changes.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Acknowledgments

- Special thanks to [OpenWeatherMap](https://openweathermap.org/) for providing the API.
- Inspired by the need for simple and effective weather applications.

---

## Contact

- **Developer:** [Samuel Dushime]
- **Email:** sdushime38@gmail.com
- **GitHub:** [Samenergy](https://github.com/Samenergy)

Feel free to reach out with any questions or feedback!
