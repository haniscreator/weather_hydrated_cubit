import 'dart:convert';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:http/http.dart' as http;

import 'weather_state.dart'; // ✅ import the new state file

class WeatherCubit extends HydratedCubit<WeatherState?> {

  WeatherCubit() : super(null);

  Future<void> fetchWeather(String cityName) async {
    final apiKey = 'put_the_api_key';
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      final temp = jsonBody['main']['temp'];
      emit(WeatherState(city: cityName, temperature: temp));
    } else {
      throw Exception('City not found');
    }
  }

  @override
  WeatherState? fromJson(Map<String, dynamic> json) {
    return WeatherState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(WeatherState? state) {
    return state?.toJson();
  }

}