import 'package:untitled/services/location.dart';
import 'package:untitled/services/networking.dart';
const myApiKey = '2b4c433638debd52696bfd1ba970182c';
const weatherUrl = 'https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {

  Future<dynamic> getCityWeather(String location) async{
    NetworkHelper http = NetworkHelper('$weatherUrl?q=$location&appid=$myApiKey&units=metric');
    return await http.getData();
  }

  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getLocation();
    var latitude = location.latitude;
    var longitude = location.longitude;

    NetworkHelper http = NetworkHelper('$weatherUrl?lat=$latitude&lon=$longitude&appid=$myApiKey&units=metric');

    return await http.getData();

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
