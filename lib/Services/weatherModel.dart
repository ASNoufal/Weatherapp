import 'package:weather_app/Services/networking.dart';
import 'package:weather_app/currentLocation.dart';

const apikey = '0b5caf9c8b122fa5d4ecb39ee53500bc';

class WeatherModel {
  Future<dynamic> cityLocation(String cityName) async {
    NetworkingHelper networkingHelper = NetworkingHelper(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apikey&units=metric');
    var weather = await networkingHelper.getweather();
    return weather;
  }

  Future<dynamic> location() async {
    Location location = Location();
    await location.getcurrentLocation();
    final lat = location.latitude;
    final lon = location.longitude;
    NetworkingHelper networkingHelper = NetworkingHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apikey&units=metric');
    var weather = await networkingHelper.getweather();
    return weather;
  }

  // class WeatherModel {
  // String getWeatherIcon(int condition) {
  //   if (condition < 300) {
  //     return '🌩';
  //   } else if (condition < 400) {
  //     return '🌧';
  //   } else if (condition < 600) {
  //     return '☔️';
  //   } else if (condition < 700) {
  //     return '☃️';
  //   } else if (condition < 800) {
  //     return '🌫';
  //   } else if (condition == 800) {
  //     return '☀️';
  //   } else if (condition <= 804) {
  //     return '☁️';
  //   } else {
  //     return '🤷‍';
  //   }
  // }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
