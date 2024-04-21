class StationDetail {
  final String title;
  double temp;
  double salinity;
  int electcon;
  int oxygen;
  double BOD;
  int measuringEquipment;
  String imagePath;
  String url;

  StationDetail({
    required this.title,
    required this.temp,
    required this.salinity,
    required this.electcon,
    required this.oxygen,
    required this.BOD,
    required this.measuringEquipment,
    required this.imagePath,
    required this.url,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'temp': temp,
      'salinity': salinity,
      'electcon': electcon,
      'oxygen': oxygen,
      'BOD': BOD,
      'measuringEquipment': measuringEquipment,
      'imagePath': imagePath,
      'url': url,
    };
  }

  factory StationDetail.fromJson(Map<String, dynamic> json) {
    return StationDetail(
      title: json['title'],
      temp: json['temp'].toDouble(),
      salinity: json['salinity'].toDouble(),
      electcon: json['electcon'],
      oxygen: json['oxygen'],
      BOD: json['BOD'].toDouble(),
      measuringEquipment: json['measuringEquipment'],
      imagePath: json['imagePath'],
      url: json['url'],
    );
  }
}
