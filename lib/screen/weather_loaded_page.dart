import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class WeatherLoadedPage extends StatelessWidget {
  const WeatherLoadedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            weatherModel.city,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            '${weatherModel.temp}°C',
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            weatherModel.weatherCondition,
            style: const TextStyle(
              fontSize: 24,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTempInfo('Max', weatherModel.maxTemp),
              _buildTempInfo('Min', weatherModel.minTemp),
            ],
          ),
          const SizedBox(height: 20),
          weatherModel.image != null
              ? Image.network(
                  'http://openweathermap.org/img/w/${weatherModel.image}.png')
              : Container(),
        ],
      ),
    );
  }

  Widget _buildTempInfo(String label, int temp) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '$temp°C',
          style: const TextStyle(
            fontSize: 24,
            color: Colors.blueAccent,
          ),
        ),
      ],
    );
  }
}
