
import 'package:clima/networking.dart';

import '../location.dart';

const openWeatherMapURL = "https://api.openweathermap.org/data/2.5/weather";
const appId = "1a72ef706aefc7f62e2f1cdba858f4ca";
const unit = "metric";
class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async{
    String url = '$openWeatherMapURL?q=$cityName&appid=$appId&units=$unit';
    return await NetworkHelper(url).getData();
  }
  Future<dynamic> getCurrenteWeather() async{
    Location l = Location();
    await l.getCurrentPosition();
    String url = "$openWeatherMapURL?lat=${l.latitude}&lon=${l.longitude}&appid=$appId&units=$unit";
    return NetworkHelper(url).getData();
  }


  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

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
