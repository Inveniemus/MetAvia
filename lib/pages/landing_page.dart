import 'package:flutter/material.dart';
import 'package:metavia/APIs/weather_api.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('MetAvia'),),
      ),
      body: Column(
        children: <Widget>[
          Text('Weather:', textScaleFactor: 2.0,),
          TextField(
            decoration: InputDecoration(
              hintText: 'ICAO code here',
            ),
            onSubmitted: (text) {
              // todo
            },
          ),
        ],
      ),
    );
  }
}
