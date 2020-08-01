part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class InitialWeatherState extends WeatherState {}

class LoadingWeatherState extends WeatherState {}

class LoadedWeatherState extends WeatherState {
  final Weather _weather;
  LoadedWeatherState(this._weather);

  Weather get weather => _weather;
}