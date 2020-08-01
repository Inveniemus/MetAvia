part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

class RequestWeatherEvent extends WeatherEvent {
  final _icaoCode;
  RequestWeatherEvent(this._icaoCode);

  String get icaoCode => _icaoCode;
}
