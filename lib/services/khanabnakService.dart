// Module
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Model
import '../models/stationModel.dart';

// Data
import '../data/khanabnak.dart';

Future<List<StationDetail>> getKhanabnakDetails() async {
  try {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      throw 'ไม่สามารถเชื่อมต่ออินเทอร์เน็ตได้ โปรดตรวจสอบการเชื่อมต่ออินเทอร์เน็ตของคุณแล้วลองอีกครั้ง';
    }
    final response =
        await http.get(Uri.parse('https://khanabnak-water.onrender.com/api'));
    if (response.statusCode == 200) {
      var khanabnakDetailJSON = jsonDecode(response.body) as List;
      fetchKhanabnakDetails(khanabnakDetailJSON);
      return khanabnakDetailList;
    } else {
      return Future.delayed(
          const Duration(seconds: 5), () => khanabnakDetailList);
    }
  } catch (e) {
    throw (e.toString());
  }
}

Future<void> fetchKhanabnakDetails(List<dynamic> detailData) async {
  for (var detail in detailData) {
    if (detailData.isNotEmpty) {
      for (var existingDetail in khanabnakDetailList) {
        // Check if the title of the detail matches any existing detail
        if (existingDetail.title == detail['title']) {
          try {
            existingDetail.temp = double.parse(detail['temp']);
            existingDetail.salinity = double.parse(detail['salinity']);
            existingDetail.electcon = int.parse(detail['electcon']);
            existingDetail.oxygen = int.parse(detail['oxygen']);
            existingDetail.BOD = double.parse(detail['BOD']);
          } catch (e) {
            if (e.runtimeType == TypeError) {
              existingDetail.temp = detail['temp'].toDouble();
              existingDetail.salinity = detail['salinity'].toDouble();
              existingDetail.electcon = detail['electcon'];
              existingDetail.oxygen = detail['oxygen'];
              existingDetail.BOD = detail['BOD'].toDouble();
              existingDetail.measuringEquipment = detail['measuringEquipment'];
              existingDetail.imagePath = detail['imagePath'];
              existingDetail.url = detail['url'];
            }
          }
          break;
        }
      }
    }
  }
}
