// Model
import '../models/stationModel.dart';

final List<String> topImagePaths = [
  "assets/images/detailpage/detailpage_slide1.jpg",
  "assets/images/detailpage/detailpage_slide2.jpg",
  "assets/images/detailpage/detailpage_slide3.jpg",
];

final List<String> headcaptions = [
  "คุณภาพน้ำตำบลขนาบนาก อ.ปากพนัง",
  "คุณภาพน้ำตำบลขนาบนาก อ.ปากพนัง",
  "คุณภาพน้ำตำบลขนาบนาก อ.ปากพนัง",
];

final List<String> captions = [
  "คุณภาพน้ำในตำบลขนาบนาก อำเภอปากพนัง จังหวัดนครศรีธรรมราช",
  "คุณภาพน้ำในตำบลขนาบนาก อำเภอปากพนัง จังหวัดนครศรีธรรมราช",
  "คุณภาพน้ำในตำบลขนาบนาก อำเภอปากพนัง จังหวัดนครศรีธรรมราช",
];

List<StationDetail> khanabnakDetailList = [
  StationDetail(
    title: "คลองบางดี",
    temp: 16.4,
    salinity: 0.17,
    electcon: 174,
    oxygen: 164,
    BOD: 9.25,
    measuringEquipment: 5,
    imagePath: 'assets/images/detailpage/khanabnak/khanabnak_img1.jpg',
    url:
        'https://khanabnak.ssru-watermonitoring.com/station_detail.php?p=MTI0MzU3MC45Mw==&s=MTU5ODg3Ni45MQ==',
  ),
  StationDetail(
    title: "คลองมาบออก",
    temp: 16.6,
    salinity: 0.14,
    electcon: 141,
    oxygen: 159,
    BOD: 9.52,
    measuringEquipment: 5,
    imagePath: 'assets/images/detailpage/khanabnak/khanabnak_img2.jpg',
    url:
        'https://khanabnak.ssru-watermonitoring.com/station_detail.php?p=MTI0MzU3MC45Mw==&s=MTQyMTIyMy45Mg==',
  ),
  StationDetail(
    title: "วัดบางอุดม",
    temp: 21.3,
    salinity: 0.22,
    electcon: 217,
    oxygen: 217,
    BOD: 9.0,
    measuringEquipment: 5,
    imagePath: 'assets/images/detailpage/khanabnak/khanabnak_img3.jpg',
    url:
        'https://khanabnak.ssru-watermonitoring.com/station_detail.php?p=MTI0MzU3MC45Mw==&s=MTA2NTkxNy45NA==',
  ),
  StationDetail(
    title: "หมู่บ้านเศรษฐกิจพอเพียงป่าขลู (หมู่ที่2)",
    temp: 15.2,
    salinity: 0.36,
    electcon: 354,
    oxygen: 343,
    BOD: 9.25,
    measuringEquipment: 5,
    imagePath: 'assets/images/detailpage/khanabnak/khanabnak_img4.jpg',
    url:
        'https://khanabnak.ssru-watermonitoring.com/station_detail.php?p=MTI0MzU3MC45Mw==&s=MTI0MzU3MC45Mw==',
  ),
];
