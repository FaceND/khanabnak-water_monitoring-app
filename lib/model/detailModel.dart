class Detail {
  final String title;
  double temp;
  double salinity;
  int electcon;
  int oxygen;
  double BOD;
  final int measuringEquipment;
  final String imagePath;
  final String url;

  Detail({
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
}
