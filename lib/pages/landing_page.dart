import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metavia/blocs/weather/weather_bloc.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('MetAvia'),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text('Weather:', textScaleFactor: 2.0,),
            TextField(
              decoration: InputDecoration(
                hintText: 'ICAO code here',
              ),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0),
              onChanged: (text) {
                if (text.length == 4) {
                  BlocProvider.of<WeatherBloc>(context).add(
                      RequestWeatherEvent(text)
                  );
                }
              },
            ),
            Divider(height: 8.0),
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is LoadedWeatherState) {
                  return Text('${state.weather.metar.rawText}\n\n${state.weather.taf.rawText}', textScaleFactor: 1.5,);
                } else if (state is LoadingWeatherState){
                  return CircularProgressIndicator();
                } else {
                  return Text('...');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
