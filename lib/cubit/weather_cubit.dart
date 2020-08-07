import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:metavia/APIs/weather_api.dart';
import 'package:metavia/models/weather.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  Future<void> getWeather(String icaoCode) async {
    try {
      emit(WeatherLoading());
      final handler = WeatherAPIHandler(icaoCode);
      final weather = await handler.fetch();
      emit(WeatherLoaded(weather));
    } on Exception catch (e) {
      // todo: see WeatherAPIHandler for exception definition
      emit(WeatherError('Network error. Check connection!'));
    }
  }
}
