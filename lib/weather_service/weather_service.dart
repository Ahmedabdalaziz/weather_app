import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseurl = "https://api.openweathermap.org/data/2.5/weather";
  final String key = "f643df9fe29ef3b14955e0de33faaa99";  // Consider storing this securely

  WeatherService(this.dio);

  Future<WeatherModel?> getCurrentWeather({required String city}) async {
    try {
      Response response = await dio.get("$baseurl?q=$city&appid=$key&units=metric");
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioError catch (e) {
      log("DioError: ${e.message}");
      return null;
    } catch (e) {
      log('Unexpected error: $e');
      return null;
    }
  }
}
