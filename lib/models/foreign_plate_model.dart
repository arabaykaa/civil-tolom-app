class ForeignPlateModel {
  final String foreignPlate;

  const ForeignPlateModel({required this.foreignPlate});

  factory ForeignPlateModel.fromJson(Map<String, dynamic> json) =>
      ForeignPlateModel(foreignPlate: json["foreignPlate"]);
}
