// Module
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as htmlParser;

// Data
import '../data/khanabnak.dart';

Future<void> fetchKhanabnakDetails() async {
  for (var detail in khanabnakDetailList) {
    Map<String, dynamic> stationData = await _fetchStationData(detail.url);

    detail.temp = (stationData['temp'] as String).isEmpty
        ? 0.0
        : double.parse(stationData['temp']!);
    detail.salinity = (stationData['salinity'] as String).isEmpty
        ? 0.0
        : double.parse(stationData['salinity']!);
    detail.electcon = (stationData['electcon'] as String).isEmpty
        ? 0
        : int.parse(stationData['electcon']!);
    detail.oxygen = (stationData['oxygen'] as String).isEmpty
        ? 0
        : int.parse(stationData['oxygen']!);
    detail.BOD = (stationData['BOD'] as String).isEmpty
        ? 0.0
        : double.parse(stationData['BOD']!);
  }
}

Future<Map<String, dynamic>> _fetchStationData(String url) async {
  var response = await http.get(Uri.parse(url));
  Map<String, dynamic> stationData = {
    'temp': '0',
    'salinity': '0',
    'electcon': '0',
    'oxygen': '0',
    'BOD': '0',
  };

  if (response.statusCode == 200) {
    var document = htmlParser.parse(response.body);
    var cardsData =
        document.querySelectorAll('.h5.mb-0.font-weight-bold.text-gray-800');
    var keys = stationData.keys.toList();

    for (int i = 0; i < keys.length && i < cardsData.length; i++) {
      stationData[keys[i]] = cardsData[i].text.trim().split(' ').first;
    }
  }
  return stationData;
}
