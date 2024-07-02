import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              var getWeatherFormCubit =
              BlocProvider.of<GetWeatherCubit>(context);
              getWeatherFormCubit.getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              labelText: "Search",
              suffixIconColor: Colors.deepPurple,
              suffixIcon: const Icon(Icons.search),
              hintText: "Enter City Name",
              border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            ),
          ),
        ),
      ),
    );
  }
}
