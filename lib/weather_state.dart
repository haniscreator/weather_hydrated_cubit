class WeatherState {
  final String city;
  final double temperature;

  WeatherState({required this.city, required this.temperature});

  factory WeatherState.fromJson(Map<String, dynamic> json) {
    return WeatherState(
      city: json['city'],
      temperature: json['temperature'],
    );
  }

  Map<String, dynamic> toJson() => {
        'city': city,
        'temperature': temperature,
      };
}
