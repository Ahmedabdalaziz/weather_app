import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';

import '../../model/weather_model.dart';
import '../../weather_service/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());

  late WeatherModel weatherModel;

  getWeather({required String cityName}) async {
    try {
      weatherModel =
          (await WeatherService(Dio()).getCurrentWeather(city: cityName))!;
      emit(LoadedWeatherState(weatherModel));
    } catch (e) {
      emit(FailedWeatherState());
    }
  }
}
