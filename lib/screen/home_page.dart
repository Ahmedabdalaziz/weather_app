import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/screen/no_weather_page.dart';
import 'package:weather_app/screen/search_view.dart';
import 'package:weather_app/screen/weather_loaded_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        backgroundColor: Colors.cyan,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SearchView(),
              ));
            },
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeather();
          } else if (state is LoadedWeatherState) {
            return const WeatherLoadedPage();
          } else if (state is FailedWeatherState) {
            return const Center(
              child: Text("Failed to fetch weather data. Please try again."),
            );
          } else {
            return const Center(
              child: Text("Unexpected error occurred."),
            );
          }
        },
      ),
    );
  }
}
