import 'package:http/http.dart' as http;
import 'package:metavia/models/weather.dart';
import 'package:xml/xml.dart' as xml;

/// This class handles the weather API. It only requires the ICAO code of the
/// airport, and a call to the fetch method.
///
/// Example:
/// ```dart
/// var weather = WeatherAPIHandler('LFPG')..fetch()
/// ```
class WeatherAPIHandler {

  // To build the Uri
  static String _authority = "www.aviationweather.gov";
  static String _unencodedPath = "adds/dataserver_current/httpparam";
  Map<String, String> _parameters = {
    'dataSource' : '',
    'requestType' : 'retrieve',
    'format' : 'xml',
    'hoursBeforeNow' : '3',
    'mostRecent' : 'true',
    'stationString' : '',
  };

  final String _icaoId;

  WeatherAPIHandler(this._icaoId) {
    _parameters['stationString'] = _icaoId;
  }

  Future<Weather> fetch() async {

    var weather = Weather();

    // 1. METAR
    _parameters['dataSource'] = 'metars';
    var uri = Uri.http(_authority, _unencodedPath, _parameters);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var document = xml.parse(response.body);
      var rawText = document.findAllElements('raw_text').first.text;
      weather.metar = Metar(rawText);
    } else {
      // todo: Create a specific exception to handle any different status code.
    }

    // 2. TAF
    _parameters['dataSource'] = 'tafs';
    uri = Uri.http(_authority, _unencodedPath, _parameters);
    response = await http.get(uri);
    if (response.statusCode == 200) {
      var document = xml.parse(response.body);
      var rawText = document.findAllElements('raw_text').first.text;
      weather.taf = Taf(rawText);
    } else {
      // todo: Create a specific exception to handle any different status code.
    }

    print(weather);
    return weather;
  }
}