import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:metavia/APIs/weather_api.dart';
import 'package:metavia/models/weather.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  @override
  WeatherState get initialState => InitialWeatherState();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    yield LoadingWeatherState();
    if (event is RequestWeatherEvent) {
      WeatherAPIHandler weatherHandler = WeatherAPIHandler(event.icaoCode);
      Weather weather = await weatherHandler.fetch();
      yield LoadedWeatherState(weather);
    }
  }
}
