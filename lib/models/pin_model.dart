class PinModel {
  final String name;

  const PinModel({required this.name});

  factory PinModel.fromJson(Map<String, dynamic> json) =>
      PinModel(name: json["name"]);
}
