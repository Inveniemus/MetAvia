/// This class handles the weather data as received from the API. It can include
/// a METAR and/or a TAF.
class Weather {
  Metar metar;
  Taf taf;

  @override
  String toString() {
    return 'METAR: ${metar.rawText}\nTAF: ${taf.rawText}';
  }
}

class Metar {
  final String _rawData;
  Metar(this._rawData);

  String get rawText => _rawData;
}

class Taf {
  final String _rawData;
  Taf(this._rawData);

  String get rawText => _rawData;
}