import 'package:flutter/material.dart';
import 'package:metavia/models/weather.dart';

class MetarWidget extends StatelessWidget {

  final Metar _metar;

  MetarWidget(this._metar);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('METAR:', textScaleFactor: 1.5, style: TextStyle(fontWeight: FontWeight.bold),),
        Text(_metar.rawText, textScaleFactor: 1.5,),
      ],
    );
  }
}

class TafWidget extends StatelessWidget {

  final Taf _taf;

  TafWidget(this._taf);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('TAF:', textScaleFactor: 1.5, style: TextStyle(fontWeight: FontWeight.bold),),
        Text(_taf.rawText, textScaleFactor: 1.5,),
      ],
    );
  }
}