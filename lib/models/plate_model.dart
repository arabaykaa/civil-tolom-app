class PlateModel {
  final String plate;

  const PlateModel({required this.plate});

  factory PlateModel.fromJson(Map<String, dynamic> json) =>
      PlateModel(plate: json["plate"]);
}
