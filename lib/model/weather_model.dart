class WeatherModel {
  final String city;
  final int temp;
  final int maxTemp;
  final int minTemp;
  final String? image;
  final int date;
  final String weatherCondition;

  WeatherModel({
    required this.city,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    this.image,
    required this.date,
    required this.weatherCondition,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      city: json['name'],
      temp: (json['main']['temp'] as num).toInt(),
      maxTemp: (json['main']['temp_max'] as num).toInt(),
      minTemp: (json['main']['temp_min'] as num).toInt(),
      date: json['dt'],
      weatherCondition: json['weather'][0]['description'],
      image: json['weather'][0]['icon'],
    );
  }
}
