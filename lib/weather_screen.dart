import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'weather_cubit.dart';
import 'weather_state.dart';

class WeatherScreen extends StatelessWidget {

  final TextEditingController _controller = TextEditingController();

  WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final cubit = context.read<WeatherCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Weather App')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration:
                  const InputDecoration(labelText: 'Enter city name'),
            ),
            ElevatedButton(
              onPressed: () {
                final city = _controller.text;
                if (city.isNotEmpty) {
                  cubit.fetchWeather(city);
                }
              },
              child: const Text('Get Weather'),
            ),
            const SizedBox(height: 20),
            BlocBuilder<WeatherCubit, WeatherState?>(
                builder: (context, state) {
                  if (state == null) {
                  return const Text('Enter a city to get weather.');
                }
                return Text(
                  'City: ${state.city}\nTemperature: ${state.temperature}°C',
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                );
              },
            ),
          ] //children
        ),
      ),
    );

  }

}