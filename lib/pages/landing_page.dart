import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metavia/cubit/weather_cubit.dart';
import 'package:metavia/widgets/weather_widgets.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('MetAvia'),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text('Weather:', textScaleFactor: 2.0,),
              TextField(
                decoration: InputDecoration(
                  hintText: 'ICAO code here',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30.0),
                onChanged: (text) {
                  if (text.length == 4) {
                    context.bloc<WeatherCubit>()
                      ..getWeather(text);
                  }
                },
              ),
              Divider(height: 8.0),
              BlocConsumer<WeatherCubit, WeatherState>(
                listener: (context, state) {
                  if (state is WeatherError) {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text(state.message),)
                    );
                  }
                },
                builder: (context, state) {
                  if (state is WeatherLoading) {
                    return LinearProgressIndicator();
                  } else if (state is WeatherLoaded) {
                    return Column(
                      children: <Widget>[
                        MetarWidget(state.weather.metar),
                        Divider(),
                        TafWidget(state.weather.taf),
                      ],
                    );
                  } else {
                    return Text('. . .');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
