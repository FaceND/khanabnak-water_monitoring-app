// Module
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';

// Model
import 'package:khanabnak_water/model/detailModel.dart';

// Data
import '../data/khanabnak.dart';

Future<List<Detail>> fetchKhanabnakDetails() async {
  try {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      throw 'ไม่สามารถเชื่อมต่ออินเทอร์เน็ตได้ โปรดตรวจสอบการเชื่อมต่ออินเทอร์เน็ตของคุณแล้วลองอีกครั้ง';
    }
    final response =
        await http.get(Uri.parse('https://khanabnak-water.onrender.com/api'));
    if (response.statusCode == 200) {
      var khanabnakDetailJSON = jsonDecode(response.body) as List;
      List<Detail> details = [];
      for (var apiDetail in khanabnakDetailJSON) {
        var existingDetail = khanabnakDetailList.firstWhere(
          (detail) => detail.title == apiDetail['title'],
          orElse: () => Detail(
            title: apiDetail['title'],
            temp: 0.0,
            salinity: 0.0,
            electcon: 0,
            oxygen: 0,
            BOD: 0.0,
            measuringEquipment: 0,
            imagePath: '',
            url: '',
          ),
        );

        // Update the existing Detail object with API data
        existingDetail.temp = double.parse(apiDetail['temp']);
        existingDetail.salinity = double.parse(apiDetail['salinity']);
        existingDetail.electcon = int.parse(apiDetail['electcon']);
        existingDetail.oxygen = int.parse(apiDetail['oxygen']);
        existingDetail.BOD = double.parse(apiDetail['BOD']);

        details.add(existingDetail); // Add the detail to the list
      }
      return details; // Return the fetched details
    } else {
      throw 'ไม่พบข้อมูลคุณภาพน้ำขนาบน้ำ โปรดลองใหม่อีกครั้ง';
    }
  } catch (e) {
    throw (e.toString());
  }
}
