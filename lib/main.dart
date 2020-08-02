import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metavia/blocs/weather/weather_bloc.dart';
import 'package:metavia/pages/landing_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiBlocProvider(
        providers: <BlocProvider>[
          BlocProvider<WeatherBloc>(
            builder: (_) => WeatherBloc(),
          )
        ],
        child: LandingPage(),
      ),
    );
  }
}
