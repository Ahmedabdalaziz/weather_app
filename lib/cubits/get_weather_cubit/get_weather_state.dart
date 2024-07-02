import 'package:weather_app/model/weather_model.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class LoadedWeatherState extends WeatherState {
  final WeatherModel weatherModel;

  LoadedWeatherState(this.weatherModel);
}

class FailedWeatherState extends WeatherState {}
